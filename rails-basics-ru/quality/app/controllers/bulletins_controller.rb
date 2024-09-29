# frozen_string_literal: true

class BulletinsController < ApplicationController
  # BEGIN
  def index
    @bulletins = Bulletin.select { |b| b.published == true }
  end

  def show
    @bulletin = Bulletin.find(params[:id])
  end
  # END
end
