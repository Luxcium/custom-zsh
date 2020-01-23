#! env
echo "${BEGIN_LOADING} ${0} ${END_LOADING}"
# echo -n "\u001b[0m\u001b[34m# LOADING... $0 \u001b[31;1m\n"

function eslint_global() {
	npm i -g install-peerdeps
	install-peerdeps -g eslint-config-airbnb-base@latest
	install-peerdeps -g eslint@latest
	install-peerdeps -g eslint-config-prettier@latest
	install-peerdeps -g eslint-plugin-import@latest
	install-peerdeps -g eslint-plugin-unicorn@latest
	install-peerdeps -g @typescript-eslint/parser@latest
	install-peerdeps -g @typescript-eslint/eslint-plugin
}
