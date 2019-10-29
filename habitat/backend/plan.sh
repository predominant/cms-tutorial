pkg_name=backend
pkg_origin=cms
pkg_version="0.1.0"
pkg_maintainer="Graham Weldon <graham@grahamweldon.com>"
pkg_description="CMS Backend"
pkg_upstream_url="https://github.com/predominant/cms-tutorial"
pkg_license=("Apache-2.0")
pkg_deps=(
  core/coreutils
  core/php
)
pkg_build_deps=(
  core/composer
)
pkg_svc_run="php-fpm -F -c ${pkg_svc_config_path}/php.ini -y ${pkg_svc_config_path}/php-fpm.conf"
pkg_exports=(
  [port]=port
)
pkg_exposes=(port)

# pkg_binds=(
#   [database]="port host"
# )
# pkg_binds_optional=(
#   [storage]="port host"
# )
# pkg_svc_user="hab"
# pkg_svc_group="$pkg_svc_user"

do_build() {
  mkdir -p "${pkg_prefix}"
  find ../../ \
    -mindepth 1 \
    -maxdepth 1 \
    -not -name .git \
    -not -name .github \
    -not -name results \
    -not -name habitat \
    -exec cp -r {} "${pkg_prefix}/" \;
  pushd "${pkg_prefix}" > /dev/null || exit 1
  COMPOSER_NO_INTERACTION=1 composer install
  fix_interpreter "bin/cake" core/coreutils bin/env
  popd > /dev/null || exit 1
}

do_install() {
  return 0
}
