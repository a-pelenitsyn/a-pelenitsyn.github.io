--------------------------------------------------------------------------------
{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
import           Control.Applicative ((<|>))
import           Data.List     (intercalate)
import           Data.Maybe    (isNothing)
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
    --                 listField "posts" postCtx (return posts) <>
    --                 constField "title" "Archives"            <>
    --                 defaultContext

    --         makeItem ""
    --             >>= loadAndApplyTemplate "templates/archive.html" archiveCtx
    --             >>= loadAndApplyTemplate "templates/default.html" archiveCtx
    --             >>= relativizeUrls

    match "pages/Projects/stability/index.md" $ do
            route $ stripPages `composeRoutes` setExtension "html"
            compile $ do
                pandocCompiler
                    >>= applyAsTemplate myDefaultContext
                    >>= loadAndApplyTemplate "templates/default.html" myDefaultContext
                    >>= relativizeUrls

    newsDependency <- makePatternDependency "data/news.yml"
    pubsDependency <- makePatternDependency "data/pubs.json"
    rulesExtraDependencies [newsDependency, pubsDependency] $ do
        match "pages/index.md" $ do
            route $ stripPages `composeRoutes` setExtension "html"
            compile $ do
                news <- unsafeCompiler loadNews
                newsItems <- mapM makeItem (take 3 news)
                pubs <- unsafeCompiler loadPublications
                pubItems <- mapM makeItem pubs
                let indexCtx =
                        listField "news" newsEntryCtx (return newsItems) <>
                        listField "pubs" publicationCtx (return pubItems) <>
                        myDefaultContext
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
                        listField "news" newsEntryCtx (return newsItems) <>
                        myDefaultContext
                getResourceBody
                    >>= applyAsTemplate newsCtx
                    >>= renderPandoc
                    >>= loadAndApplyTemplate "templates/default.html" newsCtx
                    >>= relativizeUrls


    match "pages/*.md" $ do
        route $ stripPages `composeRoutes` setExtension "html"
        compile $ do
            pandocCompiler
                >>= loadAndApplyTemplate "templates/default.html" myDefaultContext
                >>= relativizeUrls

    match "pages/404.html" $ do
        route stripPages
        compile $ do
            pandocCompiler
                >>= loadAndApplyTemplate "templates/default.html" myDefaultContext
                >>= relativizeUrls

    match "templates/*" $ compile templateBodyCompiler


--------------------------------------------------------------------------------
stripPages :: Routes
stripPages = customRoute $ drop (length ("pages/"::FilePath)) . toFilePath

--------------------------------------------------------------------------------
postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" <>
    myDefaultContext

--------------------------------------------------------------------------------
myDefaultContext :: Context String
myDefaultContext =
    constField "papersUrl" papersUrl <>
    defaultContext

papersUrl :: String
papersUrl = "https://ulysses4ever.github.io/Papers"


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
    field "date" (return . newsDate . itemBody) <>
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

--------------------------------------------------------------------------------
-- The publications are the CV's: pubs.json in the cv repo is the one list both
-- render, and `make pubs` fetches it into data/. Its fields are the CV's, and
-- cv.hs is what checks them, so this reads only what the page shows.
data Publication = Publication
    { pubTitle      :: String
    , pubAuthors    :: [String]
    , pubVenue      :: String
    , pubVenueShort :: String
    , pubDoi        :: Maybe String
    , pubPreprint   :: Maybe String
    , pubPdf        :: Maybe String
    , pubAward      :: Maybe String
    } deriving (Generic, Show)

instance Yaml.FromJSON Publication where
    parseJSON = Yaml.withObject "Publication" $ \object ->
        Publication <$> object Yaml..:  "title"
                    <*> object Yaml..:  "authors"
                    <*> object Yaml..:  "venue"
                    <*> object Yaml..:  "venueshort"
                    <*> object Yaml..:? "doi"
                    <*> object Yaml..:? "preprint"
                    <*> object Yaml..:? "pdf"
                    <*> object Yaml..:? "award"

--------------------------------------------------------------------------------
-- Everything is escaped here because the partial pastes fields in as they are.
-- `link` is the DOI, or the preprint for a paper accepted but not out yet, and
-- `preprint` is set only then, so the page can say which it is.
publicationCtx :: Context Publication
publicationCtx =
    field "title"      (return . escapeHtml . pubTitle . itemBody) <>
    field "authors"    (return . authorsHtml . pubAuthors . itemBody) <>
    field "venue"      (return . escapeHtml . pubVenue . itemBody) <>
    field "venueshort" (return . escapeHtml . pubVenueShort . itemBody) <>
    optional "link"     (\p -> fmap ("https://doi.org/" <>) (pubDoi p) <|> pubPreprint p) <>
    optional "preprint" (\p -> if isNothing (pubDoi p) then pubPreprint p else Nothing) <>
    optional "pdf"      (fmap ((papersUrl <> "/") <>) . pubPdf) <>
    optional "award"    pubAward
  where
    optional name get = field name $ \item ->
        maybe (noResult $ name <> " is not set") (return . escapeHtml) (get (itemBody item))
    authorsHtml = intercalate ", " . map author
    author a
        | a == "Artem Pelenitsyn" = "<strong>" <> escapeHtml a <> "</strong>"
        | otherwise               = escapeHtml a

--------------------------------------------------------------------------------
loadPublications :: IO [Publication]
loadPublications = do
    result <- Yaml.decodeFileEither "data/pubs.json"
    case result of
        Left err ->
            fail $ "Could not parse data/pubs.json (did `make pubs` run?): "
                <> Yaml.prettyPrintParseException err
        Right pubs ->
            -- arXiv versions are left out, as the CV leaves them out
            pure (filter ((/= "arXiv") . pubVenue) pubs)
