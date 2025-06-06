%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clearvars -global
clear_persistent_variables(fileparts(which('dynare')), false)
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info
options_ = [];
M_.fname = 'rbc_model';
M_.dynare_version = '6.3';
oo_.dynare_version = '6.3';
options_.dynare_version = '6.3';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(1,1);
M_.exo_names_tex = cell(1,1);
M_.exo_names_long = cell(1,1);
M_.exo_names(1) = {'eps'};
M_.exo_names_tex(1) = {'eps'};
M_.exo_names_long(1) = {'eps'};
M_.endo_names = cell(8,1);
M_.endo_names_tex = cell(8,1);
M_.endo_names_long = cell(8,1);
M_.endo_names(1) = {'C'};
M_.endo_names_tex(1) = {'C'};
M_.endo_names_long(1) = {'C'};
M_.endo_names(2) = {'I'};
M_.endo_names_tex(2) = {'I'};
M_.endo_names_long(2) = {'I'};
M_.endo_names(3) = {'Y'};
M_.endo_names_tex(3) = {'Y'};
M_.endo_names_long(3) = {'Y'};
M_.endo_names(4) = {'K'};
M_.endo_names_tex(4) = {'K'};
M_.endo_names_long(4) = {'K'};
M_.endo_names(5) = {'R'};
M_.endo_names_tex(5) = {'R'};
M_.endo_names_long(5) = {'R'};
M_.endo_names(6) = {'W'};
M_.endo_names_tex(6) = {'W'};
M_.endo_names_long(6) = {'W'};
M_.endo_names(7) = {'H'};
M_.endo_names_tex(7) = {'H'};
M_.endo_names_long(7) = {'H'};
M_.endo_names(8) = {'A'};
M_.endo_names_tex(8) = {'A'};
M_.endo_names_long(8) = {'A'};
M_.endo_partitions = struct();
M_.param_names = cell(5,1);
M_.param_names_tex = cell(5,1);
M_.param_names_long = cell(5,1);
M_.param_names(1) = {'beta'};
M_.param_names_tex(1) = {'beta'};
M_.param_names_long(1) = {'beta'};
M_.param_names(2) = {'alpha'};
M_.param_names_tex(2) = {'alpha'};
M_.param_names_long(2) = {'alpha'};
M_.param_names(3) = {'delta'};
M_.param_names_tex(3) = {'delta'};
M_.param_names_long(3) = {'delta'};
M_.param_names(4) = {'rho'};
M_.param_names_tex(4) = {'rho'};
M_.param_names_long(4) = {'rho'};
M_.param_names(5) = {'chi'};
M_.param_names_tex(5) = {'chi'};
M_.param_names_long(5) = {'chi'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 8;
M_.param_nbr = 5;
M_.orig_endo_nbr = 8;
M_.aux_vars = [];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
M_.surprise_shocks = [];
M_.learnt_shocks = [];
M_.learnt_endval = [];
M_.heteroskedastic_shocks.Qvalue_orig = [];
M_.heteroskedastic_shocks.Qscale_orig = [];
M_.matched_irfs = {};
M_.matched_irfs_weights = {};
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.ramsey_policy = false;
options_.discretionary_policy = false;
M_.eq_nbr = 8;
M_.ramsey_orig_eq_nbr = 0;
M_.ramsey_orig_endo_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 0 3 11;
 0 4 0;
 0 5 0;
 1 6 0;
 0 7 12;
 0 8 0;
 0 9 0;
 2 10 0;]';
M_.nstatic = 4;
M_.nfwrd   = 2;
M_.npred   = 2;
M_.nboth   = 0;
M_.nsfwrd   = 2;
M_.nspred   = 2;
M_.ndynamic   = 4;
M_.dynamic_tmp_nbr = [3; 0; 0; 0; ];
M_.equations_tags = {
  1 , 'name' , '1' ;
  2 , 'name' , '2' ;
  3 , 'name' , '3' ;
  4 , 'name' , 'R' ;
  5 , 'name' , 'W' ;
  6 , 'name' , 'I' ;
  7 , 'name' , 'Y' ;
  8 , 'name' , '8' ;
};
M_.mapping.C.eqidx = [1 2 3 ];
M_.mapping.I.eqidx = [3 6 ];
M_.mapping.Y.eqidx = [3 4 5 7 ];
M_.mapping.K.eqidx = [4 6 7 ];
M_.mapping.R.eqidx = [1 4 ];
M_.mapping.W.eqidx = [2 5 ];
M_.mapping.H.eqidx = [2 5 7 ];
M_.mapping.A.eqidx = [7 8 ];
M_.mapping.eps.eqidx = [8 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.block_structure.time_recursive = false;
M_.block_structure.block(1).Simulation_Type = 3;
M_.block_structure.block(1).endo_nbr = 1;
M_.block_structure.block(1).mfs = 1;
M_.block_structure.block(1).equation = [ 8];
M_.block_structure.block(1).variable = [ 8];
M_.block_structure.block(1).is_linear = false;
M_.block_structure.block(1).NNZDerivatives = 2;
M_.block_structure.block(1).bytecode_jacob_cols_to_sparse = [0 1 ];
M_.block_structure.block(2).Simulation_Type = 8;
M_.block_structure.block(2).endo_nbr = 7;
M_.block_structure.block(2).mfs = 6;
M_.block_structure.block(2).equation = [ 7 2 3 5 6 4 1];
M_.block_structure.block(2).variable = [ 3 6 2 7 4 5 1];
M_.block_structure.block(2).is_linear = false;
M_.block_structure.block(2).NNZDerivatives = 22;
M_.block_structure.block(2).bytecode_jacob_cols_to_sparse = [4 0 7 8 9 10 11 12 17 18 ];
M_.block_structure.block(1).g1_sparse_rowval = int32([1 ]);
M_.block_structure.block(1).g1_sparse_colval = int32([1 ]);
M_.block_structure.block(1).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure.block(2).g1_sparse_rowval = int32([4 1 3 2 4 1 2 3 5 2 3 4 5 5 1 2 6 6 6 ]);
M_.block_structure.block(2).g1_sparse_colval = int32([4 7 7 8 8 9 9 9 9 10 10 10 10 11 12 12 12 17 18 ]);
M_.block_structure.block(2).g1_sparse_colptr = int32([1 1 1 1 2 2 2 4 6 10 14 15 18 18 18 18 18 19 20 ]);
M_.block_structure.variable_reordered = [ 8 3 6 2 7 4 5 1];
M_.block_structure.equation_reordered = [ 8 7 2 3 5 6 4 1];
M_.block_structure.incidence(1).lead_lag = -1;
M_.block_structure.incidence(1).sparse_IM = [
 6 4;
 8 8;
];
M_.block_structure.incidence(2).lead_lag = 0;
M_.block_structure.incidence(2).sparse_IM = [
 1 1;
 2 1;
 2 6;
 2 7;
 3 1;
 3 2;
 3 3;
 4 3;
 4 4;
 4 5;
 5 3;
 5 6;
 5 7;
 6 2;
 6 4;
 7 3;
 7 4;
 7 7;
 7 8;
 8 8;
];
M_.block_structure.incidence(3).lead_lag = 1;
M_.block_structure.incidence(3).sparse_IM = [
 1 1;
 1 5;
];
M_.block_structure.dyn_tmp_nbr = 4;
M_.state_var = [8 4 ];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(8, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(5, 1);
M_.endo_trends = struct('deflator', cell(8, 1), 'log_deflator', cell(8, 1), 'growth_factor', cell(8, 1), 'log_growth_factor', cell(8, 1));
M_.NNZDerivatives = [25; -1; -1; ];
M_.dynamic_g1_sparse_rowval = int32([6 8 1 2 3 3 6 3 4 5 7 4 6 7 4 2 5 2 5 7 7 8 1 1 8 ]);
M_.dynamic_g1_sparse_colval = int32([4 8 9 9 9 10 10 11 11 11 11 12 12 12 13 14 14 15 15 15 16 16 17 21 25 ]);
M_.dynamic_g1_sparse_colptr = int32([1 1 1 1 2 2 2 2 3 6 8 12 15 16 18 21 23 24 24 24 24 25 25 25 25 26 ]);
M_.lhs = {
'1/C'; 
'1/C*W'; 
'C+I'; 
'R'; 
'W'; 
'I'; 
'Y'; 
'log(A)'; 
};
M_.static_tmp_nbr = [4; 0; 0; 0; ];
M_.block_structure_stat.block(1).Simulation_Type = 3;
M_.block_structure_stat.block(1).endo_nbr = 1;
M_.block_structure_stat.block(1).mfs = 1;
M_.block_structure_stat.block(1).equation = [ 8];
M_.block_structure_stat.block(1).variable = [ 8];
M_.block_structure_stat.block(2).Simulation_Type = 6;
M_.block_structure_stat.block(2).endo_nbr = 7;
M_.block_structure_stat.block(2).mfs = 7;
M_.block_structure_stat.block(2).equation = [ 2 3 4 5 6 7 1];
M_.block_structure_stat.block(2).variable = [ 6 2 5 3 4 7 1];
M_.block_structure_stat.variable_reordered = [ 8 6 2 5 3 4 7 1];
M_.block_structure_stat.equation_reordered = [ 8 2 3 4 5 6 7 1];
M_.block_structure_stat.incidence.sparse_IM = [
 1 1;
 1 5;
 2 1;
 2 6;
 2 7;
 3 1;
 3 2;
 3 3;
 4 3;
 4 4;
 4 5;
 5 3;
 5 6;
 5 7;
 6 2;
 6 4;
 7 3;
 7 4;
 7 7;
 7 8;
 8 8;
];
M_.block_structure_stat.tmp_nbr = 3;
M_.block_structure_stat.block(1).g1_sparse_rowval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colval = int32([1 ]);
M_.block_structure_stat.block(1).g1_sparse_colptr = int32([1 2 ]);
M_.block_structure_stat.block(2).g1_sparse_rowval = int32([1 4 2 5 3 7 2 3 4 6 3 5 6 1 4 6 1 2 7 ]);
M_.block_structure_stat.block(2).g1_sparse_colval = int32([1 1 2 2 3 3 4 4 4 4 5 5 5 6 6 6 7 7 7 ]);
M_.block_structure_stat.block(2).g1_sparse_colptr = int32([1 3 5 7 11 14 17 20 ]);
M_.static_g1_sparse_rowval = int32([1 2 3 3 6 3 4 5 7 4 6 7 1 4 2 5 2 5 7 7 8 ]);
M_.static_g1_sparse_colval = int32([1 1 1 2 2 3 3 3 3 4 4 4 5 5 6 6 7 7 7 8 8 ]);
M_.static_g1_sparse_colptr = int32([1 4 6 10 13 15 17 20 22 ]);
M_.params(1) = 0.99;
beta = M_.params(1);
M_.params(2) = 0.33;
alpha = M_.params(2);
M_.params(3) = 0.025;
delta = M_.params(3);
M_.params(4) = 0.95;
rho = M_.params(4);
M_.params(5) = 2.24;
chi = M_.params(5);
%
% INITVAL instructions
%
options_.initval_file = false;
oo_.steady_state(8) = 1;
oo_.steady_state(4) = (M_.params(2)*M_.params(1)/(1-M_.params(1)*(1-M_.params(3))))^(1/(1-M_.params(2)));
oo_.steady_state(7) = 0.33;
oo_.steady_state(3) = oo_.steady_state(8)*oo_.steady_state(4)^M_.params(2)*oo_.steady_state(7)^(1-M_.params(2));
oo_.steady_state(2) = M_.params(3)*oo_.steady_state(4);
oo_.steady_state(1) = oo_.steady_state(3)-oo_.steady_state(2);
oo_.steady_state(5) = M_.params(2)*oo_.steady_state(3)/oo_.steady_state(4);
oo_.steady_state(6) = (1-M_.params(2))*oo_.steady_state(3)/oo_.steady_state(7);
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
steady;
oo_.dr.eigval = check(M_,options_,oo_);
options_resid_ = struct();
display_static_residuals(M_, options_, oo_, options_resid_);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = 0.0001;
options_.graph_format = {'fig'};
options_.hp_filter = 1600;
options_.irf = 40;
options_.loglinear = true;
options_.order = 1;
var_list_ = {'Y';'C';'I';'K';'H';'W';'A';'R'};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'rbc_model_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'rbc_model_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'rbc_model_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'rbc_model_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'rbc_model_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'rbc_model_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'rbc_model_results.mat'], 'oo_recursive_', '-append');
end
if exist('options_mom_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'rbc_model_results.mat'], 'options_mom_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
