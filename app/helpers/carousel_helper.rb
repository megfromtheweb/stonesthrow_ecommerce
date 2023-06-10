module CarouselHelper
  def carousel_for(images)
    Carousel.new(self, images).html
  end

  class Carousel
    def initialize(view, images)
      @view, @images = view, images
      @uid = "carousel"
    end

    def html
      content = view.safe_join([indicators, slides, controls])
      view.content_tag(:div, content, class: 'carousel slide carousel-fade', id: @uid)
    end

    private

    attr_accessor :view, :images, :uid
    delegate :link_to, :content_tag, :image_tag, :safe_join, to: :view

    def indicators
      items = images.count.times.map { |index| indicator_tag(index) }
      content_tag(:div, safe_join(items), class: 'carousel-indicators')
    end

    def indicator_tag(index)
      options = {
        class: (index.zero? ? 'active button' : 'button'),
        data: { 
          "bs-target": "##{uid}", 
          "bs-slide_to": index 
        },
        aria: {
          label: "Slide #{index}"
        },
        type: "button"
      }

      content_tag(:button, '', options)
    end

    def slides
      items = images.map.with_index { |image, index| slide_tag(image, index.zero?) }
      content_tag(:div, safe_join(items), class: 'carousel-inner')
    end

    def slide_tag(image, is_active)
      options = {
        class: (is_active ? 'carousel-item active' : 'carousel-item'),
      }

      content_tag(:div, image_tag(image, class: 'd-block w-100'), options)
    end

    def controls
      safe_join([control_tag('prev'), control_tag('next')])
    end

    def control_tag(direction)
      options = {
        class: "carousel-control-#{direction}",
        data: { 
          "bs-slide": direction == 'prev' ? 'prev' : 'next',
          "bs-target": "##{uid}"
         }
      }
      spans = safe_join([content_tag(:span, nil, class: "carousel-control-#{direction}-icon", "aria-hidden": true), content_tag(:span, direction == 'prev' ? 'Previous' : 'Next', class: "visually-hidden")])
      control = content_tag(:button, spans, options)
    end
  end
end

# <button class="carousel-control-prev" data-bs-slide="prev" data-bs-target="#showcaseCarousel" type="button">
  # <span aria-hidden="true" class="carousel-control-prev-icon"></span>
  # <span class="visually-hidden">Previous</span></button>