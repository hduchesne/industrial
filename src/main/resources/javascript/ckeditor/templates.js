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
            },{
                title:'Heading testimonial',
                image:'heading-testimonial.png',
                description:'Heading for testimonial carousel',
                html:'<div class="name-text align-self-center">\n' +
                    '  <h2 class="heading">John Smith</h2>\n' +
                    '  <span class="meta">Free-Template.co Client</span>\n' +
                    '</div>'
            },{
                title:'Blockquote testimonial',
                image:'blockquote-testimonial.png',
                description:'Blockquote for testimonial carousel',
                html:'<blockquote>\n' +
                    '  <p>&rdquo; Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante. &ldquo;</p>\n' +
                    '</blockquote>'
            },{
                title:'Half block content',
                image:'half-block-content.png',
                description:'Title, body and button for half-block element',
                html:'<h3 class="mb-4">Our Mission</h3>\n' +
                    '<p class="mb-5">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>\n' +
                    '<p><a href="#" class="btn btn-primary btn-sm px-3 py-2">Learn More</a></p>'
            },{
                title:'Heading content',
                image:'heading-content.png',
                description:'Heading content used in top of webpages',
                html:'<h1 class="pt-5"><span>About Us</span></h1>\n' +
                    '<p class="mb-5 w-75">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vero sit, saepe? Rem, libero repellendus eum.</p>'
            }
            // {
            //     title:'Blog post 1',
            //     image:'blockquote-testimonial.png',
            //     description:'Blog post with body',
            //     html:'<div class="media mb-4 d-md-flex d-block element-animate">\n' +
            //         '  <a href="#" class="mr-5"><img src="modules/industrial/files/images/industrial_blog_1.jpg" alt="Free website template by Free-Template.co" class="img-fluid"></a>\n' +
            //         '  <div class="media-body">\n' +
            //         '    <span class="post-meta">Feb 26th, 2018</span>\n' +
            //         '    <h3 class="mt-2 text-black"><a href="#">How to handle any intercate custom design</a></h3>\n' +
            //         '    <p>Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>\n' +
            //         '    <p><a href="#" class="readmore">Read More <span class="ion-android-arrow-dropright-circle"></span></a></p>\n' +
            //         '  </div>\n' +
            //         '</div>'
            // }
        ]
    });
