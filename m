Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B33D43C04D
	for <lists+nbd@lfdr.de>; Wed, 27 Oct 2021 04:51:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 017F2203BF; Wed, 27 Oct 2021 02:51:38 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Oct 27 02:51:37 2021
Old-Return-Path: <pkalever@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2 autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 35A6120363
	for <lists-other-nbd@bendel.debian.org>; Wed, 27 Oct 2021 02:36:19 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.93 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id mfgoViErrm8H for <lists-other-nbd@bendel.debian.org>;
	Wed, 27 Oct 2021 02:36:16 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 22DA120340
	for <nbd@other.debian.org>; Wed, 27 Oct 2021 02:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635302171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mqXh93ZFW8hFzfkQUD4WZhM1OFNU+n4S2OHIXxEnQVk=;
	b=Abtk3uJ1hbcFarTbWJrs7+7QmiXMu4oSmhoeeFybnpl+ETdN8hxHt50Mp48H42Zk7yOoC2
	pF97JDjq2yD3A2D5atQH26MJN8JQD56wecFmtLIe8ADCEpt4yQUDQpQ16o5rXd5RP6Ngdi
	GDzoqYLe76KojhHT+utSDKn6BbHEBUc=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-je_AfF72Od-_HEGkSR20WA-1; Tue, 26 Oct 2021 22:20:14 -0400
X-MC-Unique: je_AfF72Od-_HEGkSR20WA-1
Received: by mail-lf1-f70.google.com with SMTP id b12-20020a0565120b8c00b003ffa7050931so630561lfv.13
        for <nbd@other.debian.org>; Tue, 26 Oct 2021 19:20:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mqXh93ZFW8hFzfkQUD4WZhM1OFNU+n4S2OHIXxEnQVk=;
        b=nZ5g3/LPLb0Kq0bKUlit+T/zWPewzzDtZLXEb1lNuDF0EMBDlCPKWC3GozkTcXuCvE
         8NYlQdDp15CYZbOngWNOnweVdWXlyMZ2c0SMu+zqm4oM8btvrDuMcWKCwXrSVy9XLIMp
         qp04jDm2JbuSxUt9E0YxHgShOjnuceeLx4xkQhDZq0/ZT+1OFXyjHcU41YUdW0RxzkBS
         TjJC43YTO9A30wlKNU6LRwIqsSS71Erx43Ka2v1Sm/qMYBvdTy/TjV7aSlec/R/TTjMm
         L9fsn5mPTfrdPjLJC02UE8xARBcVyxHRvShUj5uUYqXu8EEVZ5AmyVD0JXn9jTEV7WSR
         3cew==
X-Gm-Message-State: AOAM530PU9mAY8dRhx+mos6zzBtQbqgr4LYWI3aSA37v88p5KZPTbiV1
	11gBo5HwfX9IgSq+N+b3y8OQIoOyYAoE0/rGdU+i1CVWKRRjtcJ7ge5r+nhkf5eGxKI9KLXpWvP
	X0qQsVg+RFpoFUmFRU20PTm98Xi57Hw==
X-Received: by 2002:ac2:5e7b:: with SMTP id a27mr18585222lfr.103.1635301212862;
        Tue, 26 Oct 2021 19:20:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjJ9eMzhF9j7b0a5ruulTUMfrDQJSlIkrZ30hzGkZMx2g6pfvQe49LM5HOZ0EI4jaW4nP6IDlutoGaAHGMav4=
X-Received: by 2002:ac2:5e7b:: with SMTP id a27mr18585208lfr.103.1635301212668;
 Tue, 26 Oct 2021 19:20:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210806142914.70556-1-pkalever@redhat.com> <20210806142914.70556-2-pkalever@redhat.com>
 <YUL+1PE1z5aM0eTM@T590> <CANwsLLEgHhrh7uh+awJp-qs8xxxpwQBc6fMkEys3VMU4anvWZg@mail.gmail.com>
In-Reply-To: <CANwsLLEgHhrh7uh+awJp-qs8xxxpwQBc6fMkEys3VMU4anvWZg@mail.gmail.com>
From: Prasanna Kalever <pkalever@redhat.com>
Date: Wed, 27 Oct 2021 07:50:01 +0530
Message-ID: <CANwsLLH03KazGmog6pj6zjTTmAwr8nz1i=ZxLoyWFOUaop8xjA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] block: cleanup: define default command timeout and
 use it
To: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, nbd@other.debian.org
Cc: Ilya Dryomov <idryomov@redhat.com>, Xiubo Li <xiubli@redhat.com>, 
	Prasanna Kumar Kalever <prasanna.kalever@redhat.com>, Ming Lei <ming.lei@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkalever@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ZVH8zUTFS5L.A.DqG.56LehB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1583
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CANwsLLH03KazGmog6pj6zjTTmAwr8nz1i=ZxLoyWFOUaop8xjA@mail.gmail.com
Resent-Date: Wed, 27 Oct 2021 02:51:38 +0000 (UTC)

On Wed, Oct 27, 2021 at 7:48 AM Prasanna Kalever <pkalever@redhat.com> wrote:
>
> On Thu, Sep 16, 2021 at 1:52 PM Ming Lei <ming.lei@redhat.com> wrote:
> >
> > On Fri, Aug 06, 2021 at 07:59:13PM +0530, pkalever@redhat.com wrote:
> > > From: Prasanna Kumar Kalever <prasanna.kalever@redhat.com>
> > >
> > > defined BLK_DEFAULT_CMD_TIMEOUT and reuse it everywhere else.
> > >
> > > Signed-off-by: Prasanna Kumar Kalever <prasanna.kalever@redhat.com>
> > > ---
> >
> > Reviewed-by: Ming Lei <ming.lei@redhat.com>
>
> Thanks for the review Ming.
>
> Attempting to bring this to the top again for more reviews/acks.

oops! please ignore, this is the wrong thread.

>
>
> BRs,
> --
> Prasanna
>
> >
> > --
> > Ming
> >

