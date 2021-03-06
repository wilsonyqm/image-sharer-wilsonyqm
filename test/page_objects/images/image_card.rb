module PageObjects
  module Images
    class ImageCard < AePageObjects::Element
      def url
        node.find('img')[:src]
      end

      def tags
        node.all('.js-image-tag').map(&:text)
      end

      def edit_tags!
        node.find('.js-edit-tags').click
        window.change_to(EditPage)
      end

      def click_tag!(tag_name)
        node.click_on(tag_name)
        window.change_to(IndexPage)
      end

      def open_share_modal
        node.click_on('Share')
        share_modal = document.element(locator: '#share_modal', is: ShareModal)
        share_modal.wait_until_visible
        share_modal
      end

      def share(&block)
        share_modal = open_share_modal
        block.call(share_modal)
        share_modal.wait_until_hidden
      end
    end
  end
end
