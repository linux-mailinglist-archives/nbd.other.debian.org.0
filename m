Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 81050189560
	for <lists+nbd@lfdr.de>; Wed, 18 Mar 2020 06:33:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6837F20437; Wed, 18 Mar 2020 05:33:55 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar 18 05:33:55 2020
Old-Return-Path: <wouter@grep.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,LDO_WHITELIST
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E3EBA2042F
	for <lists-other-nbd@bendel.debian.org>; Wed, 18 Mar 2020 05:33:46 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.1 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id A_HoT8rcvSVJ for <lists-other-nbd@bendel.debian.org>;
	Wed, 18 Mar 2020 05:33:42 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from latin.grep.be (latin.grep.be [IPv6:2a01:4f8:140:52e5::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 22EAA20414
	for <nbd@other.debian.org>; Wed, 18 Mar 2020 05:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=grep.be;
	s=2017.latin; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=KyLh3bXuI0BBBjZ2AmuuEaIgkrbWG288QOScef4r1D0=; b=ClktpdjyvJhbRG7rrr3W2rnH1m
	QUTl9K0JFxXMYcbw1Pmn5FDW2omASP86hiyEb1EDmyEAWM8Isyi/CwxzrUjwGCKM1Mk+eAtbLJZb0
	QZBWFtWzbwZQELpjlo3JTSxFGajI7wQtOjrc5bEwV7mzJRr5APNsCavrRTJ6smUVAFixwH2ouRdJP
	G7vIipkMeqCoT4Idp4ezLpCSfAkgSRjvz+ATz1Kr/Xy/mnWVwmIMVKD1+Cz/pduGElQlO6epztUVX
	S5d6vYSBTyb1F7Jnq3aQCAUFH6DH+/kMiYz4PJbfEAZWGOV4yq4aA9f4+gVr1qy2dPP00B7gIjHvb
	yacWhRSg==;
Received: from wouter by latin.grep.be with local (Exim 4.92)
	(envelope-from <wouter@grep.be>)
	id 1jERKj-0005uy-CA; Wed, 18 Mar 2020 06:33:37 +0100
Date: Wed, 18 Mar 2020 06:33:37 +0100
From: Wouter Verhelst <wouter@grep.be>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Cc: nbd@other.debian.org, qemu-block@nongnu.org, eblake@redhat.com,
	w@uter.be, nsoffer@redhat.com, den@openvz.org
Subject: Re: [RFC v2] nbd/proto: introduce extended request and 64bit commands
Message-ID: <20200318053337.GE27056@grep.be>
References: <20200206151547.5812-1-vsementsov@virtuozzo.com>
 <2f56c11f-3380-9b83-6873-2ec8f4c3d07d@virtuozzo.com>
 <20200317161859.GD27056@grep.be>
 <fd6a5d69-36da-bb4f-b67d-44ef80577a88@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd6a5d69-36da-bb4f-b67d-44ef80577a88@virtuozzo.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <eL4ia4P_2cK.A.IkF.DLbceB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/861
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200318053337.GE27056@grep.be
Resent-Date: Wed, 18 Mar 2020 05:33:55 +0000 (UTC)

On Tue, Mar 17, 2020 at 09:10:32PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 17.03.2020 19:18, Wouter Verhelst wrote:
> > Hi Vladimir,
> > 
> > Sorry for the delay; I got married late last month (yay!), so obviously
> > I was a little preoccupied ;-)
> 
> Congratulations!! Be happy!
> 
> > 
> > On Fri, Feb 28, 2020 at 01:22:43PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > ping
> > > 
> > > 06.02.2020 18:15, Vladimir Sementsov-Ogievskiy wrote:
> > [...]
> > > > +The extended request message, sent by the client, looks as follows:
> > > > +
> > > > +C: 32 bits, 0x23876289, magic (`NBD_EXTENDED_REQUEST_MAGIC`)
> > > > +C: 16 bits, flags
> > > > +C: 16 bits, type
> > > > +C: 64 bits, handle
> > > > +C: 32 bits, length of payload (unsigned)
> > > > +C: *length* bytes of payload data (if *length* is nonzero)
> > [...]
> > > >        A client MUST NOT send a trim request unless `NBD_FLAG_SEND_TRIM`
> > > >        was set in the transmission flags field.
> > > > +    `NBD_CMD_TRIM` supports extended requests, with the following
> > > > +    16-bytes payload:
> > > > +
> > > > +    64 bits: offset
> > > > +    64 bits: length
> > > > +
> > > >    * `NBD_CMD_CACHE` (5)
> > > >        A cache request.  The client is informing the server that it plans
> > > > @@ -2095,6 +2127,12 @@ The following request types exist:
> > > >        including one or more sectors beyond the size of the device. It SHOULD
> > > >        return `NBD_EPERM` if it receives a write zeroes request on a read-only export.
> > > > +    `NBD_CMD_WRITE_ZEROES` supports extended requests, with the following
> > > > +    16-bytes payload:
> > > > +
> > > > +    64 bits: offset
> > > > +    64 bits: length
> > > > +
> > > >    * `NBD_CMD_BLOCK_STATUS` (7)
> > > >        A block status query request. Length and offset define the range
> > > > @@ -2154,6 +2192,12 @@ The following request types exist:
> > > >        `NBD_EINVAL` if it receives a `NBD_CMD_BLOCK_STATUS` request including
> > > >        one or more sectors beyond the size of the device.
> > > > +    `NBD_CMD_BLOCK_STATUS` supports extended requests, with the following
> > > > +    16-bytes payload:
> > > > +
> > > > +    64 bits: offset
> > > > +    64 bits: length
> > 
> > I can't actually think of any command that would not require offset and
> > length fields; and given my quote, it would appear neither can you.
> 
> Hmm. What about RESIZE? May be, some kind of REOPEN..

RESIZE would need a length. It would probably not need an offset, that
is true.

A REOPEN command could use both if we wanted to support a partial
reopen.

> > Given that, wouldn't it make more sense to have the offset and length
> > fields be part of the extended request message, and to keep the payload
> > empty for messages that don't actually send any data along? That would
> > make the handling for such messages easier to do, too. In other words,
> > make the extended request message have a magic, flags, type, handle,
> > payload length, offset, and "affected length" field, and leave payload
> > for actual data.
> > 
> 
> But why not to keep it more portable? What is a benefit?

The benefit is that you can read the whole command in one go, without
having to process the payload length and do a second read.

> I see the drawback:
> if we define it with offset/length, than, when we'll want to implement a new
> command without them, it will be incompatible extension..

No, we can just ignore the values there.

> > If somehow we do end up with a message that does not need the offset or
> > length fields, we can then always mark those as reserved and make the
> > server ignore them.
> 
> We may just invent a name for offset/lenght extended requests, something like
> "standard extended request", and instead of
> 
> >>> +    `***` supports extended requests, with the following
> >>> +    16-bytes payload:
> >>> +
> >>> +    64 bits: offset
> >>> +    64 bits: length
> 
> several times we'll have just
> 
> >>> +    `***` supports standarad extended requests
> 
> And we'll need additional paragraph, defining standard extended request, including
> its layout (64 bits offset and 64 bits length).

That still requires the second read.

> Or what you mean by "reserved"? Just treat commands with no offset/length as unknown
> commands? But this adds nothing to the spec actually.
> 
> So, do you mean, document that all extended commands have offset and length, but note
> that "in future, new commands may be added without these fields" ?

No, I just mean that if we do end up defining a command that doesn't
require either of those two fields, we can just add to the spec that
"the length and offset fields are reserved, and should be set to zero
for this command".

-- 
<Lo-lan-do> Home is where you have to wash the dishes.
  -- #debian-devel, Freenode, 2004-09-22

