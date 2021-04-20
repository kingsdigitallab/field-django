from wagtail.images.formats import Format, register_image_format


class AltTextImageFormat(Format):

    def image_to_html(self, image, alt_text, extra_attributes=None):
        default_html = super().image_to_html(
            image, image.alt_text, extra_attributes
        )
        return default_html


register_image_format(
    AltTextImageFormat('fieldimage', 'Alt text image', '', 'width-750')
)
