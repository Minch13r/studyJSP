package webapp.shopping.controller.common;

import webapp.shopping.controller.action.AddCartAction;
import webapp.shopping.controller.action.DeleteCartAction;
import webapp.shopping.controller.action.ShoppingCartAction;

import java.util.HashMap;
import java.util.Map;

public class ActionFactory {
    Map<String, Action> factory;
    ActionFactory(){
        factory = new HashMap<>();
        factory.put("ADDCART", new AddCartAction());
        factory.put("DELETECART", new DeleteCartAction());
        factory.put("SHOPPINGCART", new ShoppingCartAction());
    }

    public Action getAction(String command){
        return this.factory.get(command);
    }
}
