package org.jahia.modules.template.bootstrap4.industrial.initializers;

import org.jahia.services.content.JCRPropertyWrapper;
import org.jahia.services.content.nodetypes.ExtendedPropertyDefinition;
import org.jahia.services.content.nodetypes.ValueImpl;
import org.jahia.services.content.nodetypes.initializers.ChoiceListValue;
import org.jahia.services.content.nodetypes.initializers.ModuleChoiceListInitializer;
import org.jahia.services.content.nodetypes.renderer.AbstractChoiceListRenderer;
import org.jahia.services.content.nodetypes.renderer.ModuleChoiceListRenderer;
import org.jahia.services.render.RenderContext;
import org.json.JSONArray;
import org.json.JSONException;
import org.osgi.service.component.annotations.Component;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.jcr.PropertyType;
import javax.jcr.RepositoryException;
import javax.jcr.Value;
import java.util.*;

@Component(name = "btnDamSelectorI9r", service = ModuleChoiceListInitializer.class, immediate = true)
public class DamSelectorI9r extends AbstractChoiceListRenderer implements ModuleChoiceListInitializer, ModuleChoiceListRenderer {
    private static final Logger logger = LoggerFactory.getLogger(DamSelectorI9r.class);

    private String key="i8lDamSelectorI9r";

    /**
     * {@inheritDoc}
     */
    public List<ChoiceListValue> getChoiceListValues(ExtendedPropertyDefinition epd, String param, List<ChoiceListValue> values,
                                                     Locale locale, Map<String, Object> context) {
        //Create the list of ChoiceListValue to return
        List<ChoiceListValue> myChoiceList = new ArrayList<ChoiceListValue>();
        logger.info("**** btnGenericDamSelectorI9r -> param : "+param);

        if (context == null)
            return myChoiceList;

        try{
            JSONArray params= new JSONArray();
            if(!param.isEmpty())
                params = new JSONArray(param);
            HashMap<String, Object> myPropertiesMap = null;

            for (int i = 0, size = params.length(); i < size; i++){
                JSONArray props = params.getJSONArray(i);
                String mixin = props.getString(0);
                String value = props.getString(1);
                logger.info("**** btnGenericDamSelectorI9r -> add mixin : "+mixin+" and value : "+value);
                myPropertiesMap = new HashMap<String, Object>();
                myPropertiesMap.put("addMixin",mixin);
                myChoiceList.add(new ChoiceListValue(value,myPropertiesMap,new ValueImpl(value, PropertyType.STRING, false)));
            }

        } catch (JSONException e) {
            logger.error("Error happened", e);
        }
        //Return the list
        return myChoiceList;
    }

    /**
     * {@inheritDoc}
     */
    public void setKey(String key) {
        this.key = key;
    }

    /**
     * {@inheritDoc}
     */
    public String getKey() {
        return key;
    }

    /**
     * {@inheritDoc}
     */
    public String getStringRendering(RenderContext context, JCRPropertyWrapper propertyWrapper) throws RepositoryException {
        final StringBuilder sb = new StringBuilder();

        if (propertyWrapper.isMultiple()) {
            sb.append('{');
            final Value[] values = propertyWrapper.getValues();
            for (Value value : values) {
                sb.append('[').append(value.getString()).append(']');
            }
            sb.append('}');
        } else {
            sb.append('[').append(propertyWrapper.getValue().getString()).append(']');
        }

        return sb.toString();
    }

    /**
     * {@inheritDoc}
     */
    public String getStringRendering(Locale locale, ExtendedPropertyDefinition propDef, Object propertyValue) throws RepositoryException {
        return "[" + propertyValue.toString() + "]";
    }
}
