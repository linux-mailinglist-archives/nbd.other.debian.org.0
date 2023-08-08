Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C065E773905
	for <lists+nbd@lfdr.de>; Tue,  8 Aug 2023 10:27:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 262D620523; Tue,  8 Aug 2023 08:27:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Aug  8 08:27:12 2023
Old-Return-Path: <gregkh@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=4.0 tests=ATTENDEES_DBSPAM_BODY3,
	ATTENDEES_DBSPAM_BODY6,DIGITS_LETTERS,DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,GMAIL,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED,WORD_WITHOUT_VOWELS autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9D49A20507
	for <lists-other-nbd@bendel.debian.org>; Tue,  8 Aug 2023 08:09:11 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.609 tagged_above=-10000 required=5.3
	tests=[ATTENDEES_DBSPAM_BODY3=1, ATTENDEES_DBSPAM_BODY6=1,
	BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	GMAIL=1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01, WORD_WITHOUT_VOWELS=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Z9jD1sO8Xk7V for <lists-other-nbd@bendel.debian.org>;
	Tue,  8 Aug 2023 08:09:04 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .linuxfoundation. - helo: .dfw.source.kernel. - helo-domain: .kernel.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id CA157204E5
	for <nbd@other.debian.org>; Tue,  8 Aug 2023 08:09:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A6A376242E;
	Tue,  8 Aug 2023 08:08:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BF0FC433C7;
	Tue,  8 Aug 2023 08:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1691482139;
	bh=01W2hqms8ZqWd00aCRj2aWotAjT/HqjOmCQ8l6gmh14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iRL9wCGrwqWzwHC2s/LKjqv3DIXoaU1m1eE2ZfUKy5RP6HxhtgKGbkeEm992lG7y6
	 Sa2vW/koBPgfvyTvEwx1rfxzzVrvU8cQwwcwt109Am4XzNo0qTpaxfXVtA6c6lCxqb
	 2Xb37oJySVLIYEvtEMLb07T2TVeN24n4/helYTDY=
Date: Tue, 8 Aug 2023 10:08:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Atul Kumar Pant <atulpant.linux@gmail.com>
Cc: josef@toxicpanda.com, axboe@kernel.dk, linux-block@vger.kernel.org,
	shuah@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
	nbd@other.debian.org
Subject: Re: [PATCH v1] drivers: block: Updates return value check
Message-ID: <2023080841-preacher-lunchroom-7c8c@gregkh>
References: <20230806122351.157168-1-atulpant.linux@gmail.com>
 <2023080600-pretext-corporal-61e3@gregkh>
 <20230807114420.GA5826@atom0118>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230807114420.GA5826@atom0118>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <a-UF77w-vPJ.A.iyB.gxf0kB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2596
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/2023080841-preacher-lunchroom-7c8c@gregkh
Resent-Date: Tue,  8 Aug 2023 08:27:12 +0000 (UTC)

On Mon, Aug 07, 2023 at 05:14:20PM +0530, Atul Kumar Pant wrote:
> On Sun, Aug 06, 2023 at 03:36:18PM +0200, Greg KH wrote:
> > On Sun, Aug 06, 2023 at 05:53:51PM +0530, Atul Kumar Pant wrote:
> > > Updating the check of return value from debugfs_create_dir
> > > to use IS_ERR.
> > 
> > Why?
> > 
> > > 
> > > Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
> > > ---
> > >  drivers/block/nbd.c     | 4 ++--
> > >  drivers/block/pktcdvd.c | 2 +-
> > >  2 files changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> > > index 9c35c958f2c8..65ecde3e2a5b 100644
> > > --- a/drivers/block/nbd.c
> > > +++ b/drivers/block/nbd.c
> > > @@ -1666,7 +1666,7 @@ static int nbd_dev_dbg_init(struct nbd_device *nbd)
> > >  		return -EIO;
> > >  
> > >  	dir = debugfs_create_dir(nbd_name(nbd), nbd_dbg_dir);
> > > -	if (!dir) {
> > > +	if (IS_ERR(dir)) {
> > >  		dev_err(nbd_to_dev(nbd), "Failed to create debugfs dir for '%s'\n",
> > >  			nbd_name(nbd));
> > >  		return -EIO;
> > 
> > This isn't correct, sorry.  Please do not make this change.
> > 
> > > @@ -1692,7 +1692,7 @@ static int nbd_dbg_init(void)
> > >  	struct dentry *dbg_dir;
> > >  
> > >  	dbg_dir = debugfs_create_dir("nbd", NULL);
> > > -	if (!dbg_dir)
> > > +	if (IS_ERR(dbg_dir))
> > >  		return -EIO;
> > 
> > Again, not corrct.
> > 
> > >  	nbd_dbg_dir = dbg_dir;
> > > diff --git a/drivers/block/pktcdvd.c b/drivers/block/pktcdvd.c
> > > index d5d7884cedd4..69e5a100b3cf 100644
> > > --- a/drivers/block/pktcdvd.c
> > > +++ b/drivers/block/pktcdvd.c
> > > @@ -451,7 +451,7 @@ static void pkt_debugfs_dev_new(struct pktcdvd_device *pd)
> > >  	if (!pkt_debugfs_root)
> > >  		return;
> > >  	pd->dfs_d_root = debugfs_create_dir(pd->name, pkt_debugfs_root);
> > > -	if (!pd->dfs_d_root)
> > > +	if (IS_ERR(pd->dfs_d_root))
> > >  		return;
> > 
> > Also not correct.
> > 
> > Why check the return value at all?  As this check has always been wrong,
> > why are you wanting to keep it?
> 
>     I'll check the code again. I was not aware that this check is wrong,
>     so just tried to fix this based on return value of
>     debugfs_create_dir.

The return value of debugfs_create_dir() should never need to be checked
at all.  The value passed in can be later used in any debugfs call
safely, be it an error or success.  The kernel logic should NOT change
based on if debugfs is working properly or not.

So for stuff like this, where the check is obviously wrong (i.e. it's
never caught an error, it's even more of a good idea to remove the
check.

> > 
> > Also, you never responded to our previous review comments, why not?  To
> > ignore people is not generally considered a good idea :(
> 
>     I might have missed seeing your comments hence I did not reply back.
>     Please accept my sincere apologies for this.

Oops, nope, my apologies, this was my fault.  I got you confused with a
different developer sending patches to the kernel-mentees mailing list
with the same first name.  I should have checked better, again my fault,
sorry.

So all is good with your responses, but you should fix these up to NOT
check the return value at all.

thanks,

greg k-h

