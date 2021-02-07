globalvar gamechoice;
globalvar samesession; samesession = false;
audio_group_load(audgroup_Music);
if(instance_exists(EventListener)) instance_destroy(EventListener);
if(instance_exists(QuestDirector)) instance_destroy(QuestDirector);