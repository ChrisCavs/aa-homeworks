const path = require('path');

module.exports = {
    entry: "./js/app.js",
    output: {
        path: path.resolve(__dirname, 'js'),
        filename: "bundle.js"
    },


    module: {
        rules: [
            {
                test: [/\.jsx?$/],
                exclude: /(node_modules)/,
                use: {
                    loader: 'babel-loader',
                    query: {
                        presets: ['env', 'react']
                    }
                },
            }
        ]
    },

    devtool: "source-map",

    resolve: {
        extensions: ['.js', '.jsx', '*']
    }
}