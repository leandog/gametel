package com.example.android.apis.view;

import java.util.*;

import android.app.ListActivity;
import android.content.Context;
import android.os.Bundle;
import android.view.*;
import android.widget.*;

import com.example.android.apis.R.id;
import com.example.android.apis.R.layout;

public class List18 extends ListActivity {
    
    private List<CustomItem> customItems = new ArrayList<List18.CustomItem>();
    
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        
        add("Tom", "32", "This is Tom, he likes long walks in the park.");
        add("Dick", "17", "Lorem ipsum");
        add("Harry", "42", "There one was an old woman");
        add("Larry", "39", "Lived in a shoe, yes.");
        
        getListView().setAdapter(new CustomItemAdapter());
        
    }

    private void add(String name, String age, String summary) {
        customItems.add(new CustomItem(name, age, summary));
    }
    
    private class CustomItemAdapter extends ArrayAdapter<CustomItem> {

        public CustomItemAdapter() {
            super(List18.this, layout.list_18_item, customItems);
        }
        
        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            View theView = convertView;
            
            if( theView == null) {
                LayoutInflater inflater = (LayoutInflater) getApplication().getSystemService(Context.LAYOUT_INFLATER_SERVICE);
                theView = inflater.inflate(layout.list_18_item, null);
            }
            
            final CustomItem customItem = customItems.get(position);
            setText(theView, id.name, customItem.name);
            setText(theView, id.age, customItem.age);
            setText(theView, id.summary, customItem.summary);
            
            return theView;
        }

        private void setText(View theView, int textId, String text) {
            final TextView theText = find(theView, textId);
            theText.setText(text);
        }
        
        @SuppressWarnings("unchecked")
        private <ViewType extends View> ViewType find(final View parent, int theId) {
            return (ViewType) parent.findViewById(theId);
        }
        
    }
    
    private class CustomItem {

        private String name;
        private String age;
        private String summary;
        
        public CustomItem(final String name, final String age, final String summary) {
            this.name = name;
            this.age = age;
            this.summary = summary;
        }

    }

}
