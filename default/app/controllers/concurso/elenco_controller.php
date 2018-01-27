
<?php
Load::models('concurso/xelenco');
class ElencoController extends BackendController{
	protected function before_filter() {
        //Se cambia el nombre del módulo actual
        $this->page_module = 'Gestión de Concurso';
    }

    public function index() {
        Redirect::toAction('listar');
    }

    public function listar($order='order.id.asc', $page='page.1') { 
        $page = (Filter::get($page, 'page') > 0) ? Filter::get($page, 'page') : 1;
        $elenco = new Xelenco();
        $this->elencos=$elenco->getListado($order, $page);
        $this->order = $order;        
        $this->page_title = 'Listado de elencos';
    }

    public function agregar() {
        if(Input::hasPost('elenco')) {
            if(Xelenco::setTipo('create', Input::post('elenco'))){
                if(APP_AJAX) {
                    Flash::valid('El registro se ha creado correctamente! <br/>Por favor recarga la página para verificar los cambios.');
                } else {
                    Flash::valid('El registro se ha creado correctamente!');
                }
                return Redirect::toAction('listar');
            }
        }
        $this->page_title = 'Agregar Elenco';
    }
}

