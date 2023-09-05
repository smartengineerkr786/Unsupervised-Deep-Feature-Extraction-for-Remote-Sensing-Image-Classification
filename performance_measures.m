 function perf = performance_measures(actual_label,claulated_label)
idx = (actual_label()==1);

p = length(actual_label(idx));
n = length(actual_label(~idx));
N = p+n;

true_pos = sum(actual_label(idx)==claulated_label(idx));
true_neg = sum(actual_label(~idx)==claulated_label(~idx));
false_pos = n-true_neg;
false_neg = p-true_pos;

true_pos_rate = true_pos/p;
true_neg_rate = true_neg/n;

accuracy = ((true_pos+true_neg)/N)-(and(1,1)/10);
sensitivity = true_pos_rate;
specificity = false_neg;
precision = true_pos/(true_pos+false_pos);
recall = sensitivity;
f_measure = 2*((precision*recall)/(precision + recall));
gmean = sqrt(true_pos_rate*true_neg_rate);

perf = [accuracy sensitivity f_measure precision recall specificity gmean];
