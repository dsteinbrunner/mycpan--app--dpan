use ExtUtils::MakeMaker;

require 5.006;

eval "use Test::Manifest 1.21";

WriteMakefile(
	'NAME'	       => 'MyCPAN::App::DPAN',
	'ABSTRACT'     => 'Create a custom, private DarkPAN repository that looks just like a real CPAN',
	'VERSION_FROM' => 'lib/DPAN.pm',
	'LICENSE'      => 'perl',
	'AUTHOR'       => 'brian d foy <bdfoy@cpan.org>',
	
	'PREREQ_PM'    => { 
		'CPAN::Checksums'      => '0',
		'CPAN::PackageDetails' => '0.24',
		'IPC::Cmd'             => '0',
		'IPC::System::Simple'  => '0',
		'Log::Log4perl'        => '0',
		'MyCPAN::Indexer'      => '1.28_04',
		'LWP::Simple'          => '0',
		'Test::Output'         => '0.13',
		'version'              => '0',
		},
	
	'PM'           => {
		'lib/Indexer.pm'        => '$(INST_LIBDIR)/DPAN/Indexer.pm',
		'lib/DPAN.pm'           => '$(INST_LIBDIR)/DPAN.pm',
		'lib/Minimal.pm'        => '$(INST_LIBDIR)/DPAN/Reporter/Minimal.pm',
		'lib/AsYAML.pm'         => '$(INST_LIBDIR)/DPAN/Reporter/AsYAML.pm',
		'lib/SkipQueue.pm'      => '$(INST_LIBDIR)/DPAN/SkipQueue.pm',
		'lib/CPANUtils.pm'      => '$(INST_LIBDIR)/DPAN/CPANUtils.pm',
		'lib/NullPostFlight.pm' => '$(INST_LIBDIR)/DPAN/NullPostFlight.pm',
		'lib/SVNPostFlight.pm'  => '$(INST_LIBDIR)/DPAN/SVNPostFlight.pm',
		},


	'MAN3PODS'     => {},
	
	'EXE_FILES'    => [ qw(script/dpan) ],
	
	clean  => { FILES    => q|MyCPAN-* test-corpus/modules test-corpus/indexer_reports| },

	);
