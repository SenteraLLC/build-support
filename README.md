# version.sh
This shell script will inspect your project to determine a version
number when deploying your service, and return a version number to
stdout.

## Three supported scenarios

### .version (on master branch)
If you track versions manually, either using SemVer or some other
scheme, you can put it into a `.version` file in the root directory of
your project. The contents of the `.version` file are returned with
a `v` prefix. For example... contents of version file:
```
1.0.0
```

version.sh output:

```
v1.0.0
```

Note: You could auto-generate a `.version` file automatically (eg. via
Travis-CI) based on that same information tracked elsewhere, such as
`package.json`.

### YYYY-MM-DD.SHA (on master branch)
If you do not track versions manually (i.e. a `.version` file does not
exist in your project), a version will be created using the current
date followed by the git SHA of the HEAD, e.g. `2019-10-2.b3bf3d9`

### branch/sha (on non-master branch)
If you are not on master, the version will indicate the deployed
branch followed by the SHA of that branch,
e.g. `a-test-branch/53574e8`, irrespective of whether you have a
tracked version for `master`

## Example usage
This is a handy one-liner that can be used in a build script:
``` shell
wget -O - https://github.com/SenteraLLC/version.sh/raw/master/version.sh | bash
```
