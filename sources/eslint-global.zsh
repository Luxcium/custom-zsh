#! env 

function () {
	npm i -g install-peerdeps;
install-peerdeps -g eslint-config-airbnb-base@latest;
install-peerdeps -g eslint@latest;
install-peerdeps -g eslint-config-prettier@latest;
install-peerdeps -g eslint-plugin-import@latest;
install-peerdeps -g eslint-plugin-unicorn@latest;
install-peerdeps -g @typescript-eslint/parser@latest;
install-peerdeps -g @typescript-eslint/eslint-plugin;
}