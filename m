Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F1277D4AB
	for <lists+nbd@lfdr.de>; Tue, 15 Aug 2023 22:57:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9B6EC21DD0; Tue, 15 Aug 2023 20:57:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Aug 15 20:57:12 2023
Old-Return-Path: <atulpant.linux@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=4.0 tests=ATTENDEES_DBSPAM_BODY3,
	ATTENDEES_DBSPAM_BODY6,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
	DKIM_VALID_EF,FOURLA,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	WORD_WITHOUT_VOWELS autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id EA01721CDA
	for <lists-other-nbd@bendel.debian.org>; Tue, 15 Aug 2023 20:32:54 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.901 tagged_above=-10000 required=5.3
	tests=[ATTENDEES_DBSPAM_BODY3=1, ATTENDEES_DBSPAM_BODY6=1,
	BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, FREEMAIL_FROM=0.001,
	RCVD_IN_DNSWL_NONE=-0.0001, WORD_WITHOUT_VOWELS=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id rZAlAL7uWz6m for <lists-other-nbd@bendel.debian.org>;
	Tue, 15 Aug 2023 20:32:49 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id A7EC421CEC
	for <nbd@other.debian.org>; Tue, 15 Aug 2023 20:32:49 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1bdb801c667so36606395ad.1
        for <nbd@other.debian.org>; Tue, 15 Aug 2023 13:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692131565; x=1692736365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f78QLwWdjf5nhnpij9qeDiPQOcJiRGv74f6b7uyo3QM=;
        b=bmezdNajNttT3ChzGuDLC7xVQG8VnuPBiS7hTHhSDx2dZBp+mtf8hTjMgHlEJ1nxqW
         +u2x8hTxcFBecBDrjCobQCstwic5Wz9dJIYaCCTyddq0WxCMk5PQmMID7gL394UZfsWR
         QKa4RTPkqGUhoKoMHmF7e3gCB8Q5RzYp6kQ3RJN5fce25MrH/FpoJX3AomKsthj6E/i5
         kl5sYag54nRbLgITw11ybwnuNjmoIK2rtIuJeh24FQ9Rb65i5p+18GRsvilq75TTehZm
         AdNNG4KWeoty4fJmEBHYFQvy+SlbIOM/Vfy4PKBY7rUHTcPZeu/pWM4iQ/KymgEl7pAK
         w0zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692131565; x=1692736365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f78QLwWdjf5nhnpij9qeDiPQOcJiRGv74f6b7uyo3QM=;
        b=jAaM5tB+XXNQzLPUNHTAnApxoHSS7o1vCBXT62HcbtRwNTdX9+NknydUjekxuW58Mo
         CVlELMKtkhcwCZEs/W3CAQHk7JeJu7BF99YgBt9zXkezUlKzX5wsDJyT4KGqmT4vCjU0
         nE0ojXJExYeRjRYcjFz1wsoQ/uj2yr16zDkx1z2xrIzRPSiJ+JIGuuat0Iv3cc9aiego
         KEcQtOx4Fj89c1Iu7118ZxsAbq4dTP+Ws7Ia8bD9Peo11Lfzo9i+LtmJjvJGLnK7xtyC
         ToUldLHnUjXL9FzMrBqPr2nKrSoHRvCA502Lw7cpkdOg/RoOzCB+KlVhggziryP0bf5w
         r+lQ==
X-Gm-Message-State: AOJu0YzyC2DBAbsJpEIfU0IXit992Lxx2sJN4iZzPlvQXLm4VKk2cW0Q
	VI7Hwe73L2tY9tbHLZPXI38=
X-Google-Smtp-Source: AGHT+IGvMbrBUd0UeJGvIVkEEz2k+h0uKVNb7GxkO8suDTf/vzzd5R4ANiVYsunoU5o57BAp7b87PQ==
X-Received: by 2002:a17:902:e751:b0:1bc:9651:57c6 with SMTP id p17-20020a170902e75100b001bc965157c6mr18632643plf.57.1692131565029;
        Tue, 15 Aug 2023 13:32:45 -0700 (PDT)
Received: from atom0118 ([2405:201:c009:58e9:db85:3caf:1429:e455])
        by smtp.gmail.com with ESMTPSA id e2-20020a17090301c200b001bb97e51ab4sm11489270plh.98.2023.08.15.13.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 13:32:44 -0700 (PDT)
Date: Wed, 16 Aug 2023 02:02:20 +0530
From: Atul Kumar Pant <atulpant.linux@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: josef@toxicpanda.com, axboe@kernel.dk, linux-block@vger.kernel.org,
	shuah@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
	nbd@other.debian.org
Subject: Re: [PATCH v1] drivers: block: Updates return value check
Message-ID: <20230815203220.GA51427@atom0118>
References: <20230806122351.157168-1-atulpant.linux@gmail.com>
 <2023080600-pretext-corporal-61e3@gregkh>
 <20230807114420.GA5826@atom0118>
 <2023080841-preacher-lunchroom-7c8c@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023080841-preacher-lunchroom-7c8c@gregkh>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Fi-aUsFvYiL.A.szH.oa-2kB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2628
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230815203220.GA51427@atom0118
Resent-Date: Tue, 15 Aug 2023 20:57:12 +0000 (UTC)

On Tue, Aug 08, 2023 at 10:08:56AM +0200, Greg KH wrote:
> On Mon, Aug 07, 2023 at 05:14:20PM +0530, Atul Kumar Pant wrote:
> > On Sun, Aug 06, 2023 at 03:36:18PM +0200, Greg KH wrote:
> > > On Sun, Aug 06, 2023 at 05:53:51PM +0530, Atul Kumar Pant wrote:
> > > > Updating the check of return value from debugfs_create_dir
> > > > to use IS_ERR.
> > > 
> > > Why?
> > > 
> > > > 
> > > > Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
> > > > ---
> > > >  drivers/block/nbd.c     | 4 ++--
> > > >  drivers/block/pktcdvd.c | 2 +-
> > > >  2 files changed, 3 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> > > > index 9c35c958f2c8..65ecde3e2a5b 100644
> > > > --- a/drivers/block/nbd.c
> > > > +++ b/drivers/block/nbd.c
> > > > @@ -1666,7 +1666,7 @@ static int nbd_dev_dbg_init(struct nbd_device *nbd)
> > > >  		return -EIO;
> > > >  
> > > >  	dir = debugfs_create_dir(nbd_name(nbd), nbd_dbg_dir);
> > > > -	if (!dir) {
> > > > +	if (IS_ERR(dir)) {
> > > >  		dev_err(nbd_to_dev(nbd), "Failed to create debugfs dir for '%s'\n",
> > > >  			nbd_name(nbd));
> > > >  		return -EIO;
> > > 
> > > This isn't correct, sorry.  Please do not make this change.
> > > 
> > > > @@ -1692,7 +1692,7 @@ static int nbd_dbg_init(void)
> > > >  	struct dentry *dbg_dir;
> > > >  
> > > >  	dbg_dir = debugfs_create_dir("nbd", NULL);
> > > > -	if (!dbg_dir)
> > > > +	if (IS_ERR(dbg_dir))
> > > >  		return -EIO;
> > > 
> > > Again, not corrct.
> > > 
> > > >  	nbd_dbg_dir = dbg_dir;
> > > > diff --git a/drivers/block/pktcdvd.c b/drivers/block/pktcdvd.c
> > > > index d5d7884cedd4..69e5a100b3cf 100644
> > > > --- a/drivers/block/pktcdvd.c
> > > > +++ b/drivers/block/pktcdvd.c
> > > > @@ -451,7 +451,7 @@ static void pkt_debugfs_dev_new(struct pktcdvd_device *pd)
> > > >  	if (!pkt_debugfs_root)
> > > >  		return;
> > > >  	pd->dfs_d_root = debugfs_create_dir(pd->name, pkt_debugfs_root);
> > > > -	if (!pd->dfs_d_root)
> > > > +	if (IS_ERR(pd->dfs_d_root))
> > > >  		return;
> > > 
> > > Also not correct.
> > > 
> > > Why check the return value at all?  As this check has always been wrong,
> > > why are you wanting to keep it?
> > 
> >     I'll check the code again. I was not aware that this check is wrong,
> >     so just tried to fix this based on return value of
> >     debugfs_create_dir.
> 
> The return value of debugfs_create_dir() should never need to be checked
> at all.  The value passed in can be later used in any debugfs call
> safely, be it an error or success.  The kernel logic should NOT change
> based on if debugfs is working properly or not.
> 
> So for stuff like this, where the check is obviously wrong (i.e. it's
> never caught an error, it's even more of a good idea to remove the
> check.

	Understood. I'll fix this in a new patch.
> 
> > > 
> > > Also, you never responded to our previous review comments, why not?  To
> > > ignore people is not generally considered a good idea :(
> > 
> >     I might have missed seeing your comments hence I did not reply back.
> >     Please accept my sincere apologies for this.
> 
> Oops, nope, my apologies, this was my fault.  I got you confused with a
> different developer sending patches to the kernel-mentees mailing list
> with the same first name.  I should have checked better, again my fault,
> sorry.
> 
	No worries!

> So all is good with your responses, but you should fix these up to NOT
> check the return value at all.
> 
> thanks,
> 
> greg k-h

