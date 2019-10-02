# version.sh
This shell script will inspect your project to determine a version number when deploying your service. It handles three cases:

## .version
If you track versions manually, either using SemVer or some other scheme, you can put it into a `.version` file (you could even generate one automatically in your travis build based on that same information tracked elsewhere, such as a `package.json`.). The entire contents of the `.version` file are returned verbatim.

## YYYY-MM-DD.SHA
If you do not track versions manually (i.e. a `.version` file does not exist in your project), a version will be created using the current date followed by the git SHA of the HEAD, e.g. `2019-10-2.b3bf3d9`

## branch/sha
If you are not on master, the version will indicate the deployed branch followed by the SHA of that branch, e.g. `a-test-branch/53574e8`
