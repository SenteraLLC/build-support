const fs = require('fs')
const { spawnSync } = require('child_process')

describe('env-tags.sh', () => {
  let branchName, expected
  afterEach(() => {
    // Override git command, which is used in `env-tags.sh` to query
    // the branch name:
    const bashrcPath = './tests/.bashrc'
    fs.writeFileSync(bashrcPath, `
function git() {
  echo "${branchName}"
}

export -f git`
    )

    const actual = spawnSync(
      `source ${bashrcPath} && ./env-tags.sh`,
      [],
      { shell: true }
    ).stdout.toString('utf8')
    expect(actual.trim()).toBe(expected)
  })

  it('dev -> dev', () => {
    branchName = 'dev'
    expected = 'dev'
  })

  it('dev.2022.03.02 -> dev', () => {
    branchName = 'dev.2022.03.02'
    expected = 'dev'
  })

  it('staging -> staging', () => {
    branchName = 'staging'
    expected = 'staging'
  })

  it('staging.2021.01.01 -> staging', () => {
    branchName = 'staging.2021.01.01'
    expected = 'staging'
  })

  it('staging2 -> staging2', () => {
    branchName = 'staging2'
    expected = 'staging2'
  })

  it('staging2.2021.01.01 -> staging2', () => {
    branchName = 'staging2.2021.01.01'
    expected = 'staging2'
  })

  it('master -> prod', () => {
    branchName = 'master'
    expected = 'prod'
  })

  it('main -> prod', () => {
    branchName = 'main'
    expected = 'prod'
  })

  it('does not wildcard after main', () => {
    branchName = 'main-feature-branch'
    expected = ''
  })

  it('does not map foo to any environment', () => {
    branchName = 'foo'
    expected = ''
  })
})
