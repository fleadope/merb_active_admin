# Note: This file is read in by active_admin.rb and several of the :symbols are replaced
#       with meaningful Ruby classes and values.

class :controller_class < Base
  before :set_model_class
  
  def list(page = 1, per_page = 15)
    @paginated = @model.paginate(page.to_i, per_page.to_i)
    @objects = @paginated.all
    active_admin_render(:list)
  end

  def show(id)
    @object = @model[id]
    raise NotFound, "#{@model} #{id} not found" if @object.nil?
    active_admin_render(:show)
  end
  
  def new
    active_admin_render(:new)
  end
  
  def create(object)
    @model.create(object)
    redirect active_admin_url(:list)
  end

  def edit(id)
    @object = @model[id]
    raise NotFound, "#{@model} #{id} not found" if @object.nil?
    active_admin_render(:edit)
  end

  def update(id, object)
    @model[id].update(object)
    redirect active_admin_url(:list)
  end

  def destroy(id)
    @model[id].destroy
    redirect active_admin_url(:list)
  end
  
  private
  
  def set_model_class
    @model = :model_class
  end
end
