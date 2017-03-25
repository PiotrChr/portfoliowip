const path = require('path');
const babel = require('babel-loader');
const webpack = require('webpack');
const node_dir = __dirname + '/node_modules';

module.exports = {
    entry: {
        app: './js/main.js'
    },
    output: {
        filename: './js/bin/[name].bundle.js',
        sourceMapFilename: './js/bin/[name].bundle.map'
    },
    plugins: [
        new webpack.ProvidePlugin({
            $: "jquery",
            jQuery: "jquery",
            "window.jQuery": "jquery"
        })
    ],
    devtool: '#source-map',
    module: {
        loaders: [
            {
                loader: 'babel',
                test: /\.jsx?$/,
                exclude: /(node_modules|bower_components)/,
                query: {
                    presets: ['es2015']
                }
            }
        ]
    },
    resolve: {
        root: path.resolve('./js'),
        extensions: ['', '.js'],
        alias: {
            'jquery-ui': node_dir + '/jquery-ui/build/release.js',
            'jquery': node_dir + '/jquery/dist/jquery.js'
        }
    }
};