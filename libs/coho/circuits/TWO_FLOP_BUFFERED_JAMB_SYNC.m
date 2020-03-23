classdef TWO_FLOP_BUFFERED_JAMB_SYNC < circuit
    % Definition of a PASSGATE_LATCH with PASSGATE elements and INVERTERS
    %
    % The passgate latch has 5 input nodes:
    % 1. vdd:    power supply source
    % 2. gnd:    circuit ground
    % 3. d:      data input
    % 4. clk:    clock input
    % 5. clkbar: clock bar (i.e. the opposite polarity to clock)
    % The passgate latch has 2 output nodes:
    % 1. q:      output
    % 2. qbar:   output bar (i.e. the opposite polarity to q)
    %
    % To create a PASSGATE_LATCH, requires
    % 1. name: passgate latch name
    % 2. wid: circuit width, wid(1) is for the INV
    %                        wid(2) is for the PASSGATE
    % 3. rlen: relative circuit length, use 1 by default.
    % E.g. pgLatch = PASSGATE_LATCH('pg0',[
    
    properties (GetAccess = 'public', SetAccess = 'private')
        vdd,gnd,d,clk,clkbar,reset; q,qbar; %Input ; Output
    end
    
    methods
        function this = TWO_FLOP_BUFFERED_JAMB_SYNC(name,wid,rlen)
            if(nargin<2||isempty(name)||isempty(wid))
                error('must provide name and width');
            end
            if(nargin<3||isempty(rlen)), rlen = 1; end
            if(numel(wid)==1)
                widMaster = wid;
                widSlave = wid;
                widBufOut = [1;1]*wid;
            else
                assert(length(wid) == 38)
                widBufOut = wid(1:2);
                widMaster = wid(3:20);
                widSlave  = wid(21:end);
                
            end
            this = this@circuit(name);
            %set the relative lengths by default to be be the same
            rlenMaster = rlen;
            rlenSlave = rlen;
            rlenBufferOut = rlen;
            if(iscell(rlen))
                rlenMaster = rlen{1};
                rlenSlave = rlen{2};
                rlenBufferOut = rlen{3};
            end
            %define circuit nodes
            %inputs
            this.d = this.add_port(node('d'));
            this.clk = this.add_port(node('clk'));
            this.clkbar = this.add_port(node('clkbar'));
            this.vdd = this.add_port(node('vdd'));
            this.gnd = this.add_port(node('gnd'));
            this.reset = this.add_port(node('reset'));
            
            %outpus
            this.q = this.add_port(node('q'));
            this.qbar = this.add_port(node('qbar'));
            
            bufInvOut     = INV4(strcat(name,' bufOut'),widBufOut,rlenBufferOut); this.add_element(bufInvOut);
            jamb_ffMaster = JAMB_FF(strcat(name,' JFF_0'),widMaster,rlenMaster); this.add_element(jamb_ffMaster);
            jamb_ffSlave  = JAMB_FF(strcat(name,' JFF_1'),widSlave,rlenSlave); this.add_element(jamb_ffSlave);
            
            
            this.connect(this.d,jamb_ffMaster.d);
            this.connect(jamb_ffMaster.q,jamb_ffSlave.d);
            this.connect(this.q,jamb_ffSlave.q,bufInvOut.i);
            this.connect(this.qbar,bufInvOut.o);
            this.connect(this.clk,jamb_ffMaster.clk,jamb_ffSlave.clk);
            this.connect(this.clkbar,jamb_ffMaster.clkbar,jamb_ffSlave.clkbar);
            this.connect(this.vdd,jamb_ffMaster.vdd,jamb_ffSlave.vdd,bufInvOut.vdd);
            this.connect(this.gnd,jamb_ffMaster.gnd,jamb_ffSlave.gnd,bufInvOut.gnd);
            this.connect(this.reset,jamb_ffMaster.reset,jamb_ffSlave.reset);
            
            this.finalize;
            
        end
        
    end
end

