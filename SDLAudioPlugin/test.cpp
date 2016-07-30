extern "C" void createPlugin(const char *name,void**a);

int main()
{
	void **a;
	createPlugin("SDLAudioPlugin",a);
	return 0;
}
