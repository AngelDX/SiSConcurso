<?php

class Xcalificacion extends ActiveRecord {

	public function getListado($order='', $page=0) {        
        $order = $this->get_order($order, 'id', array(            
            'nombre' => array(
                'ASC' => 'nombre ASC',
                'DESC' => 'nombre DESC'
            )
        ));
         if($page) {
            return $this->paginated("order: $order", "page: $page");
        } else {
            return $this->find("order: $order");
        }  
    }

    public static function setTipo($method, $data, $optData=null) {        
        $obj = new Xelenco($data); //Se carga los datos con los de las tablas        
        if($optData) { //Se carga información adicional al objeto
            $obj->dump_result_self($optData);
        }
         //Verifico que no exista otro menu, y si se encuentra inactivo lo active
        $conditions = empty($obj->id)? "nombre='$obj->nombre'" : "nombre='NULL' AND id = 'NULL'";

        $old = new Xelenco();
        if($old->find_first($conditions)) {
            if($method=='create' && $old->nombre != $obj->nombre) {
                $obj->id = $old->id;
                $method = 'update';
            } else {
                Flash::info('Ya existe un registro con esos datos.');
                return FALSE;
            }
        }
   
        return ($obj->$method()) ? $obj : FALSE;
    }
}

?>