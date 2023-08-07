Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id E357B772344
	for <lists+nbd@lfdr.de>; Mon,  7 Aug 2023 14:00:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C11322049D; Mon,  7 Aug 2023 12:00:21 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Aug  7 12:00:21 2023
Old-Return-Path: <atulpant.linux@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=4.0 tests=ATTENDEES_DBSPAM_BODY6,
	DIGITS_LETTERS,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,FREEMAIL_FROM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	WORD_WITHOUT_VOWELS autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C9F5520415
	for <lists-other-nbd@bendel.debian.org>; Mon,  7 Aug 2023 11:44:40 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.911 tagged_above=-10000 required=5.3
	tests=[ATTENDEES_DBSPAM_BODY6=1, BAYES_00=-2, DIGITS_LETTERS=1,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, FREEMAIL_FROM=0.001,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01, WORD_WITHOUT_VOWELS=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 4pE0S1j8qgYY for <lists-other-nbd@bendel.debian.org>;
	Mon,  7 Aug 2023 11:44:32 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 0747A2049B
	for <nbd@other.debian.org>; Mon,  7 Aug 2023 11:44:31 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-686be28e1a8so2950384b3a.0
        for <nbd@other.debian.org>; Mon, 07 Aug 2023 04:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691408668; x=1692013468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QOkIol4hR/7Xp5+ZchryLNdE6H11vBt5X3cu3NIuMdw=;
        b=FZAQ6U1Y1GJmYiveH7OoBA/d7SuG2Q4mQa2C8A1p3nqxsUUDi2IaX+mreRbkwecRrX
         mpP9EjkIjcP2hq912NLJVLbR9VXO95Hi8xZACAHBwHdzzqKz2TP5YGL8FyHeflnoBits
         AVcu07vz4ZL/ic0U+wtaGmULdMLRNZf6uu7zc7M3nnGoZafTulK0YVm3C2WytdT+VFN0
         ZUUuS56gkObDy7l8rYRQWv50WoGQep0LUDw3Kk81Z1WR1qT8NbB3D+g9cMlkzSyvHpFF
         6q19Xh/FpWgJXoEAwXFFMb09rsveZujIWSEtwhrWZJcVFvgh+Y252O04PsVGtQITuev5
         8EtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691408668; x=1692013468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QOkIol4hR/7Xp5+ZchryLNdE6H11vBt5X3cu3NIuMdw=;
        b=B32dIr7OluTPc/EWUbZSXnXTShMwY5ZjBhWqcPkHg5ngERYc7mY5Cck0D65YU5+cy9
         qBoXq1bUNHrZ1Fny2HDpLaKpbJyj1+MBiYC76PHd79KURZK/CAWgWQ7RDaiTMEclnNFN
         eNtiu09KvqnQXFg70XdAsBehmUF8OnMjTWQ81nGVMk+GiyzaxXS+7hRHXM4Z9P0C9gIK
         7jQc/guZ2AUT2cIv5AbNZ7D/HYElhsgQLw7JLJf7amlZvVqNS7RfwAArr/QaiPWF1pRx
         e9xIyrYEYNNWpvPgH3zBZshF+/36nA8j8rJ0qKB8GNW7duX+Rc37jnP66IrK5Azgh7ZJ
         I7jQ==
X-Gm-Message-State: AOJu0YyzGwcsgcBDIv/QeXuctgCdxiKpFgQuXyPpbGS3xwEise1Ggckf
	b1LlSqbjCI++O3Ckg1mSt78=
X-Google-Smtp-Source: AGHT+IG4wOGScrDd781Ew8BOJkUd67naeJwhj+rXjQM3v/SE7uDYrg2SNYLgg04stiJNcFMGbZ/jMw==
X-Received: by 2002:a05:6a00:24c4:b0:682:4b93:a4d3 with SMTP id d4-20020a056a0024c400b006824b93a4d3mr9204926pfv.1.1691408667970;
        Mon, 07 Aug 2023 04:44:27 -0700 (PDT)
Received: from atom0118 ([2405:201:c009:58e9:4d3a:892b:8e74:8cec])
        by smtp.gmail.com with ESMTPSA id z22-20020aa791d6000000b006875493da1fsm6193034pfa.10.2023.08.07.04.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 04:44:27 -0700 (PDT)
Date: Mon, 7 Aug 2023 17:14:20 +0530
From: Atul Kumar Pant <atulpant.linux@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: josef@toxicpanda.com, axboe@kernel.dk, linux-block@vger.kernel.org,
	shuah@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
	nbd@other.debian.org
Subject: Re: [PATCH v1] drivers: block: Updates return value check
Message-ID: <20230807114420.GA5826@atom0118>
References: <20230806122351.157168-1-atulpant.linux@gmail.com>
 <2023080600-pretext-corporal-61e3@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023080600-pretext-corporal-61e3@gregkh>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <io-dCO8VdgN.A.PlH.VzN0kB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2595
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230807114420.GA5826@atom0118
Resent-Date: Mon,  7 Aug 2023 12:00:21 +0000 (UTC)

On Sun, Aug 06, 2023 at 03:36:18PM +0200, Greg KH wrote:
> On Sun, Aug 06, 2023 at 05:53:51PM +0530, Atul Kumar Pant wrote:
> > Updating the check of return value from debugfs_create_dir
> > to use IS_ERR.
> 
> Why?
> 
> > 
> > Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
> > ---
> >  drivers/block/nbd.c     | 4 ++--
> >  drivers/block/pktcdvd.c | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> > index 9c35c958f2c8..65ecde3e2a5b 100644
> > --- a/drivers/block/nbd.c
> > +++ b/drivers/block/nbd.c
> > @@ -1666,7 +1666,7 @@ static int nbd_dev_dbg_init(struct nbd_device *nbd)
> >  		return -EIO;
> >  
> >  	dir = debugfs_create_dir(nbd_name(nbd), nbd_dbg_dir);
> > -	if (!dir) {
> > +	if (IS_ERR(dir)) {
> >  		dev_err(nbd_to_dev(nbd), "Failed to create debugfs dir for '%s'\n",
> >  			nbd_name(nbd));
> >  		return -EIO;
> 
> This isn't correct, sorry.  Please do not make this change.
> 
> > @@ -1692,7 +1692,7 @@ static int nbd_dbg_init(void)
> >  	struct dentry *dbg_dir;
> >  
> >  	dbg_dir = debugfs_create_dir("nbd", NULL);
> > -	if (!dbg_dir)
> > +	if (IS_ERR(dbg_dir))
> >  		return -EIO;
> 
> Again, not corrct.
> 
> >  	nbd_dbg_dir = dbg_dir;
> > diff --git a/drivers/block/pktcdvd.c b/drivers/block/pktcdvd.c
> > index d5d7884cedd4..69e5a100b3cf 100644
> > --- a/drivers/block/pktcdvd.c
> > +++ b/drivers/block/pktcdvd.c
> > @@ -451,7 +451,7 @@ static void pkt_debugfs_dev_new(struct pktcdvd_device *pd)
> >  	if (!pkt_debugfs_root)
> >  		return;
> >  	pd->dfs_d_root = debugfs_create_dir(pd->name, pkt_debugfs_root);
> > -	if (!pd->dfs_d_root)
> > +	if (IS_ERR(pd->dfs_d_root))
> >  		return;
> 
> Also not correct.
> 
> Why check the return value at all?  As this check has always been wrong,
> why are you wanting to keep it?

    I'll check the code again. I was not aware that this check is wrong,
    so just tried to fix this based on return value of
    debugfs_create_dir.

> 
> Also, you never responded to our previous review comments, why not?  To
> ignore people is not generally considered a good idea :(

    I might have missed seeing your comments hence I did not reply back.
    Please accept my sincere apologies for this.
    I have one confusion though, regarding the comments that you are
    referring to. Are you mentioning about this patch? Re: [PATCH v5] selftests: rtc: Improve rtctest error handling
    Here I got the following response from your email bot -
    Patch submitter, please ignore Markus's suggestion; you do not need to follow it at all.

    Maybe I misunderstood this comment and hence did not reply/do
    anything in response to Markus's comments.
    If you were referring to some other patch then if possible, can you please tell me the
    suject of the patch? I will reply to your comments and will make the
    fixes accordingly.

> 
> greg k-h

