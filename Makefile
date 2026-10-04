##
# My webisite
.PHONY: all build pubs generate serve

all: build generate

build:
	nix-build

# The publications are the CV's: pubs.json in the cv repo is the one list both
# render. Fetched via a temporary, so a failed download keeps the last good copy
# rather than leaving half a file for site.hs to choke on.
pubs:
	curl -fsSL -o data/pubs.json.tmp https://raw.githubusercontent.com/ulysses4ever/cv/master/pubs.json
	mv data/pubs.json.tmp data/pubs.json

generate: pubs
	./result/bin/site rebuild

serve:
	./result/bin/site server

# end
