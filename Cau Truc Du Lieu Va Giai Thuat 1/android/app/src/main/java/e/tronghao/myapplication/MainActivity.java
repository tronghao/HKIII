package e.tronghao.myapplication;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        LinearLayout ln = (LinearLayout) findViewById(R.id.ll);
        TextView abc = new TextView(this);
        abc.setText("Lam chơi coi sao");
        abc.setTextSize(30);
        ln.addView(abc);
        ;
        Button btn = (Button) findViewById(R.id.bt1);
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(MainActivity.this, thu2.class);
                startActivity(intent);
            }
        });

    }
}
