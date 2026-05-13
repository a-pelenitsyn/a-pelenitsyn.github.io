--------------------------------------------------------------------------------
{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid   (mappend)
import qualified Data.Yaml     as Yaml
import           GHC.Generics  (Generic)
import           Hakyll


--------------------------------------------------------------------------------
main :: IO ()
main = hakyll $ do
    match "images/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    -- match (fromList ["pages/about.rst", "pages/contact.md"]) $ do
    --     route   $ stripPages `composeRoutes` setExtension "html"
    --     compile $ pandocCompiler
    --         >>= loadAndApplyTemplate "templates/default.html" defaultContext
    --         >>= relativizeUrls

    -- match "posts/*" $ do
    --     route $ setExtension "html"
    --     compile $ pandocCompiler
    --         >>= loadAndApplyTemplate "templates/post.html"    postCtx
    --         >>= loadAndApplyTemplate "templates/default.html" postCtx
    --         >>= relativizeUrls

    -- create ["archive.html"] $ do
    --     route idRoute
    --     compile $ do
    --         posts <- recentFirst =<< loadAll "posts/*"
    --         let archiveCtx =
    --                 listField "posts" postCtx (return posts) `mappend`
    --                 constField "title" "Archives"            `mappend`
    --                 defaultContext

    --         makeItem ""
    --             >>= loadAndApplyTemplate "templates/archive.html" archiveCtx
    --             >>= loadAndApplyTemplate "templates/default.html" archiveCtx
    --             >>= relativizeUrls

    match "pages/Projects/stability/index.md" $ do
            route $ stripPages `composeRoutes` setExtension "html"
            compile $ do
                pandocCompiler
                    >>= loadAndApplyTemplate "templates/default.html" defaultContext
                    >>= relativizeUrls

    newsDependency <- makePatternDependency "data/news.yml"
    rulesExtraDependencies [newsDependency] $ do
        match "pages/index.md" $ do
            route $ stripPages `composeRoutes` setExtension "html"
            compile $ do
                news <- unsafeCompiler loadNews
                newsItems <- mapM makeItem (take 3 news)
                let indexCtx =
                        listField "news" newsEntryCtx (return newsItems) `mappend`
                        defaultContext
                getResourceBody
                    >>= applyAsTemplate indexCtx
                    >>= renderPandoc
                    >>= loadAndApplyTemplate "templates/default.html" indexCtx
                    >>= relativizeUrls

        match "pages/news.md" $ do
            route $ stripPages `composeRoutes` setExtension "html"
            compile $ do
                news <- unsafeCompiler loadNews
                newsItems <- mapM makeItem news
                let newsCtx =
                        listField "news" newsEntryCtx (return newsItems) `mappend`
                        defaultContext
                getResourceBody
                    >>= applyAsTemplate newsCtx
                    >>= renderPandoc
                    >>= loadAndApplyTemplate "templates/default.html" newsCtx
                    >>= relativizeUrls


    match "pages/404.html" $ do
        route stripPages
        compile $ do
            pandocCompiler
                >>= loadAndApplyTemplate "templates/default.html" defaultContext
                >>= relativizeUrls

    match "templates/*" $ compile templateBodyCompiler


--------------------------------------------------------------------------------
stripPages :: Routes
stripPages = customRoute $ drop (length ("pages/"::FilePath)) . toFilePath

--------------------------------------------------------------------------------
postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" `mappend`
    defaultContext


--------------------------------------------------------------------------------
data NewsEntry = NewsEntry
    { newsDate :: String
    , newsText :: String
    } deriving (Generic, Show)

instance Yaml.FromJSON NewsEntry where
    parseJSON = Yaml.withObject "NewsEntry" $ \object ->
        NewsEntry <$> object Yaml..: "date"
                  <*> object Yaml..: "text"

--------------------------------------------------------------------------------
newsEntryCtx :: Context NewsEntry
newsEntryCtx =
    field "date" (return . newsDate . itemBody) `mappend`
    field "text" (return . newsText . itemBody)

--------------------------------------------------------------------------------
loadNews :: IO [NewsEntry]
loadNews = do
    result <- Yaml.decodeFileEither "data/news.yml"
    case result of
        Left err ->
            fail $ "Could not parse data/news.yml: " <> Yaml.prettyPrintParseException err
        Right news ->
            pure news
