/// @desc
if(anim_for){
	tran_alpha = min(1, tran_alpha + 0.05);
};
if(tran_alpha >= 1 && anim_for){
	anim_for = false;
	alarm[0] = 40; //How long the screen stays black
};
if(anim_bak){
	tran_alpha = max(0, tran_alpha - 0.05);
};
if(anim_bak && tran_alpha <= 0){
	instance_destroy();
};