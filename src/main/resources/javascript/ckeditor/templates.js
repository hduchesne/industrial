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
                title:'Heading content',
                image:'heading-content.png',
                description:'Heading content used in top of webpages',
                html:'<h1 class="pt-5"><span>About Us</span></h1>\n' +
                    '<p class="mb-5 w-75">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vero sit, saepe? Rem, libero repellendus eum.</p>'
            },{
                title:'Heading testimonial',
                image:'heading-testimonial.png',
                description:'Heading for testimonial carousel',
                html:'<div class="name-text align-self-center">\n' +
                    '  <h2 class="heading">John Smith</h2>\n' +
                    '  <span class="meta">Free-Template.co Client</span>\n' +
                    '</div>'
            },{
                title:'Section heading',
                image:'section-heading.png',
                description:'Section heading elements. Create an <h2> and <p> html tag',
                html:'<h2 class="heading mb-4">Projects</h2>\n' +
                    '<p class="mb-5 lead">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>'
            },{
                title:'Media Block',
                image:'media-block.png',
                description:'',
                html:'<div class="media block-6 d-block text-center">\n' +
                    '  <div class="icon mb-3"><span class="ion-ios-notifications text-primary"></span></div>\n' +
                    '  <div class="media-body">\n' +
                    '    <h3 class="heading">Modern Design</h3>\n' +
                    '    <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic.</p>\n' +
                    '  </div>\n' +
                    '</div>'
            },{
                title:'Feature Block',
                image:'feature-block.png',
                description:'',
                html:'<div class="feature-1 d-md-flex">\n' +
                    '  <div class="align-self-center">\n' +
                    '    <span class="ion ion-ios-easel display-4 text-primary"></span>\n' +
                    '    <h3>Ducting Design</h3>\n' +
                    '    <p>Even the all-powerful Pointing has no control about the blind texts.</p>\n' +
                    '  </div>\n' +
                    '</div>'
            },{
                title:'Text Block',
                image:'text-block.png',
                description:'',
                html:'<div class="block-41">\n' +
                    '  <h2 class="block-41-heading mb-5">We\'ll handle any intercate custom design</h2>\n' +
                    '  <div class="block-41-text">\n' +
                    '    <p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>\n' +
                    '    <p><a href="#" class="readmore">Read More <span class="ion-md-arrow-dropright-circle"></span></a></p>\n' +
                    '  </div>\n' +
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
                title:'Team card body',
                image:'team-card-body.png',
                description:'',
                html:'<div class="media-body">\n' +
                    '  <h3 class="mt-0 text-black">Mike Richardson</h3>\n' +
                    '</div>'
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
            //         '    <p><a href="#" class="readmore">Read More <span class="ion-md-arrow-dropright-circle"></span></a></p>\n' +
            //         '  </div>\n' +
            //         '</div>'
            // }
        ]
    });
