const serverContext = (typeof contextJsParameters != 'undefined') ? contextJsParameters.contextPath : '';
const pickerEnginesContext = `${serverContext}/engines/contentpicker.jsp`;
const moduleContext = `${serverContext}/modules/industrial`;
const ckeditorContext = `${moduleContext}/javascript/ckeditor`;

CKEDITOR.editorConfig = function (config) {
    config.allowedContent = true;

    config.contextPath = serverContext;
    config.language = (typeof contextJsParameters != 'undefined') ? contextJsParameters.uilang : 'en';
    config.contentlanguage = (typeof contextJsParameters != 'undefined') ? contextJsParameters.lang : 'en';
    config.siteUuid = (typeof contextJsParameters != 'undefined') ? contextJsParameters.siteUuid : '';

    config.filebrowserWindowFeatures = 'location=no,menubar=no,toolbar=no,dependent=yes,minimizable=no,modal=yes,alwaysRaised=yes,resizable=yes,scrollbars=yes';
    config.filebrowserWindowName = 'JahiaFileBrowser';
    config.filebrowserBrowseUrl = `${pickerEnginesContext}?site=${config.siteUuid}&lang=${config.contentlanguage}&uilang=${config.language}`;
    config.filebrowserImageBrowseUrl =`${config.filebrowserBrowseUrl}&type=imagepicker`;
    config.filebrowserLinkBrowseUrl = `${config.filebrowserBrowseUrl}&type=editoriallinkpicker`;
    config.image_previewText = '';

    // config.toolbar = 'Tinny'; //moved to ckeditor config in cnd

    config.templates = 'industrial,default';
    config.stylesSet = `B4:${ckeditorContext}/stylesSet.js`;
    config.contentsCss = [
        `${serverContext}/modules/bootstrap4-core/css/bootstrap.min.css`,
        `${moduleContext}/css/style.css`
    ];
    config.templates_files = [
        `${ckeditorContext}/templates.js`,
        `${serverContext}/modules/bootstrap4-components/javascript/cktemplates.js`
    ];

//'wsc','Scayt', 'ACheck', 'SpellChecker',
    config.toolbar_Tinny = [
        ['Source', '-', 'Templates', 'PasteText','Styles'],
        ['Bold','Italic'],
        ['NumberedList', 'BulletedList', 'Outdent','Indent', 'Blockquote'],
        ['JustifyLeft','JustifyCenter','JustifyRight'],
        ['Link', 'Unlink','Anchor','Image'],
        ['RemoveFormat','HorizontalRule','ShowBlocks']
    ];

//acheck,wsc,scayt,
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