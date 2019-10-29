pkg_name=database
pkg_origin=cms
pkg_version="0.1.0"
pkg_maintainer="Graham Weldon <graham@grahamweldon.com>"
pkg_description="CMS Database"
pkg_upstream_url="https://github.com/predominant/cms-tutorial"
pkg_license=("Apache-2.0")
pkg_deps=(
  core/mysql
  cms/backend
)
pkg_build_deps=(
  core/composer
  core/php
)
# pkg_svc_run="haproxy -f $pkg_svc_config_path/haproxy.conf"
pkg_exports=(
  [port]=port
)
pkg_exposes=(port ssl-port)

