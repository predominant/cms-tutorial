pkg_name=proxy
pkg_origin=cms
pkg_version="0.1.0"
pkg_maintainer="Graham Weldon <graham@grahamweldon.com>"
pkg_description="CMS Proxy / Frontend"
pkg_upstream_url="https://github.com/predominant/cms-tutorial"
pkg_license=("Apache-2.0")
pkg_deps=(
  core/nginx
  cms/backend
)
pkg_build_deps=()
pkg_svc_run="nginx -c ${pkg_svc_config_path}/nginx.conf"
pkg_exports=(
  [port]=port
)
pkg_exposes=(port)
pkg_binds=(
  [backend]="port"
)
pkg_svc_user="root"
pkg_svc_group="${pkg_svc_user}"

do_build() {
  return 0
}

do_install() {
  return 0
}
