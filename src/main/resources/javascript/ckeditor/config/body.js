CKEDITOR.editorConfig = function (config) {
    config.serverContext = (typeof contextJsParameters != 'undefined') ? contextJsParameters.contextPath : '';
    config.pickerEnginesContext = `${config.serverContext}/engines/contentpicker.jsp`;
    config.moduleContext = `${config.serverContext}/modules/industrial`;
    config.ckeditorContext = `${config.moduleContext}/javascript/ckeditor`;

    config.allowedContent = true;

    config.language = (typeof contextJsParameters != 'undefined') ? contextJsParameters.uilang : 'en';
    config.contentlanguage = (typeof contextJsParameters != 'undefined') ? contextJsParameters.lang : 'en';
    config.siteUuid = (typeof contextJsParameters != 'undefined') ? contextJsParameters.siteUuid : '';

    config.filebrowserWindowFeatures = 'location=no,menubar=no,toolbar=no,dependent=yes,minimizable=no,modal=yes,alwaysRaised=yes,resizable=yes,scrollbars=yes';
    config.filebrowserWindowName = 'JahiaFileBrowser';
    config.filebrowserBrowseUrl = `${config.pickerEnginesContext}?site=${config.siteUuid}&lang=${config.contentlanguage}&uilang=${config.language}`;
    config.filebrowserImageBrowseUrl =`${config.filebrowserBrowseUrl}&type=imagepicker`;
    config.filebrowserLinkBrowseUrl = `${config.filebrowserBrowseUrl}&type=editoriallinkpicker`;
    config.image_previewText = '';

    // config.toolbar = 'Tinny'; //moved to ckeditor config in cnd
    config.templates = 'industrial,default';
    config.stylesSet = `B4:${config.ckeditorContext}/stylesSet.js`;
    config.contentsCss = [
        `${config.serverContext}/modules/bootstrap4-core/css/bootstrap.min.css`,
        `${config.moduleContext}/css/style.css`
    ];
    config.templates_files = [
        `${config.serverContext}/modules/bootstrap4-components/javascript/cktemplates.js`,
        `${config.ckeditorContext}/templates.js`
    ];


    config.toolbar_Tinny = [
        ['Source', '-', 'Templates', 'PasteText','Styles'],
        ['Bold','Italic'],
        ['NumberedList', 'BulletedList', 'Outdent','Indent', 'Blockquote'],
        ['JustifyLeft','JustifyCenter','JustifyRight'],
        ['Link', 'Unlink','Anchor','Image'],
        ['RemoveFormat','HorizontalRule','ShowBlocks']
    ];

    // config.extraPlugins = 'acheck,wsc,scayt,macrosdropdown';
    config.extraPlugins = 'macrosdropdown';
    config.templates_replaceContent = false;

    // [ Left, Center, Right, Justified ]
    config.justifyClasses = [ 'text-left', 'text-center', 'text-right', 'text-justify' ];
};

CKEDITOR.addCss(
    '.cke_combopanel { width:300px !important;}'
)
CKEDITOR.dtd.$removeEmpty['i'] = 0;
CKEDITOR.dtd.$removeEmpty['span'] = 0;
CKEDITOR.dtd.$removeEmpty['div'] = 0;
CKEDITOR.dtd.$removeEmpty['em'] = 0;

CKEDITOR.on('instanceReady', function() {
    $(".cke_combo_inlinelabel").text("Inline styles");
});