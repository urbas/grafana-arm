# Releasing a new version
Pick the new version from the [Grafana Releases] page.

Update the version with this script:
```bash
VERSION=x.y.z;
git ls-files | xargs -n 1 sed -i "s,[0-9]\+\.[0-9]\+\.[0-9]\+,$VERSION,g"
```


[Grafana Releases]: https://github.com/grafana/grafana/releases