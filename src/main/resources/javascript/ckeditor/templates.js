CKEDITOR.addTemplates('industrial',
    {
        // The name of the subfolder that contains the preview images of the templates.
        imagesPath:((typeof contextJsParameters != 'undefined') ? contextJsParameters.contextPath : '') + '/modules/industrial/images/ckeditor/',
        // Template definitions.
        templates:[
            {
                title:'Caption carousel',
                image:'caption-carousel.png',
                description:'Caption for standard carousel',
                html:'<h1 class="mb-4"><span>We Are Industrial Company</span></h1>\n' +
                    '<p class="mb-5 w-75">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias iste ipsa excepturi nostrum sequi molestias?</p>'
            },
            {
                title:'Heading testimonial',
                image:'heading-testimonial.png',
                description:'Heading for testimonial carousel',
                html:'<div class="name-text align-self-center">\n' +
                    '  <h2 class="heading">John Smith</h2>\n' +
                    '  <span class="meta">Free-Template.co Client</span>\n' +
                    '</div>'
            },
            {
                title:'Blockquote testimonial',
                image:'blockquote-testimonial.png',
                description:'Blockquote for testimonial carousel',
                html:'<blockquote>\n' +
                    '  <p>&rdquo; Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante. &ldquo;</p>\n' +
                    '</blockquote>'
            }
        ]
    });
