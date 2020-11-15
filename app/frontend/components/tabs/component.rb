# frozen_string_literal: true

class Tabs::Component < ApplicationViewComponent
  include ViewComponent::Slotable

  with_slot :tab, collection: true, class_name: "Tab"

  option :active, optional: true

  attr_reader :active_tab

  def before_render
    @active_tab = tabs.find { _1.id == active } || tabs.first
  end

  def render?
    tabs.any?
  end

  class Tab < ViewComponent::Slot
    extend Dry::Initializer

    option :label
    option :id
  end
end
