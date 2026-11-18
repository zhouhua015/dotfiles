s/(#\[fg=[^]]+\])\[[0-9]{2}:[0-9]{2}:[0-9]{2}\] /\1/g
# Hide completion entries from Pi sessions that have not reloaded notify.ts yet.
s@#\[fg=[^]]+\]Pi/[^#]*: #\[[^]]+\]Agent has finished #\[default\](  #\[[^]]+\]│#\[default\]  )?@@g
s/  #\[[^]]+\]│#\[default\]  $//
s/ #\[default\]  #\[fg=[^]]+\]│(#\[[^]]+\])  /#[default] #[fg=black]•\1 /g
/./s/( #\[default\])?$/#[default] #[fg=black]• #[default]/
s/Agent has finished|Task (finished|completed)/✅/g
s/Needs your approval/❔/g
s/Needs attention/⚠️/g
s/Task failed/❌/g
