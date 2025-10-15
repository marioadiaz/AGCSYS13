class OrdenTrabajosController < ApplicationController
  before_action :set_orden_trabajo, only: %i[ show edit update destroy ]

  # GET /orden_trabajos or /orden_trabajos.json
  def index
    @orden_trabajos = OrdenTrabajo.all
  end

  # GET /orden_trabajos/1 or /orden_trabajos/1.json
  def show
  end

  # GET /orden_trabajos/new
  def new
    @orden_trabajo = OrdenTrabajo.new
  end

  # GET /orden_trabajos/1/edit
  def edit
  end

  # POST /orden_trabajos or /orden_trabajos.json
  def create
    @orden_trabajo = OrdenTrabajo.new(orden_trabajo_params)

    respond_to do |format|
      if @orden_trabajo.save
        format.html { redirect_to @orden_trabajo, notice: "Orden trabajo was successfully created." }
        format.json { render :show, status: :created, location: @orden_trabajo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @orden_trabajo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orden_trabajos/1 or /orden_trabajos/1.json
  def update
    respond_to do |format|
      if @orden_trabajo.update(orden_trabajo_params)
        format.html { redirect_to @orden_trabajo, notice: "Orden trabajo was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @orden_trabajo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @orden_trabajo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orden_trabajos/1 or /orden_trabajos/1.json
  def destroy
    @orden_trabajo.destroy!

    respond_to do |format|
      format.html { redirect_to orden_trabajos_path, notice: "Orden trabajo was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orden_trabajo
      @orden_trabajo = OrdenTrabajo.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def orden_trabajo_params
      params.expect(orden_trabajo: [ :trnum, :trcan, :trcar, :clinom, :papel, :gramaje, :colores, :pliego, :nomprod, :fecentr, :cam10, :cam12, :cam24, :procesos, :observaciones, :estado_actual, :estado, :deadline, :priority ])
    end
end
