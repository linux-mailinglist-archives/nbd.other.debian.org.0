Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF303926F0
	for <lists+nbd@lfdr.de>; Thu, 27 May 2021 07:39:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6914220648; Thu, 27 May 2021 05:39:26 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu May 27 05:39:26 2021
Old-Return-Path: <pkalever@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 58FC420571
	for <lists-other-nbd@bendel.debian.org>; Thu, 27 May 2021 05:23:17 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.748 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1,
	DKIMWL_WL_HIGH=-0.374, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 1cI4Y4lTMHyn for <lists-other-nbd@bendel.debian.org>;
	Thu, 27 May 2021 05:23:12 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .redhat. - helo: .us-smtp-delivery-124.mimecast. - helo-domain: .mimecast.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 03A9420648
	for <nbd@other.debian.org>; Thu, 27 May 2021 05:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622092986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kMolLnDEuKlCbbgIOvjZGGBzK5WYRhCAHto1CLY+p8s=;
	b=XULPeLq3QGRSX1CM1NhKeagjMDCxJTtEqCtAkbs5glwYW/SCVOUeEF0PMvHFPy1/sk0y6l
	zztM9Giiw09cywKBkutH7zkmySffsVYcjzRz5ODMIn0GeL47dcfafwfX0Ls4zcGeyRO8mT
	HZZKafdICDlO1Gs0utD+Dgsi/ViEnBM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-7t9vgx3TMpShWiyyyJmy6Q-1; Thu, 27 May 2021 01:23:03 -0400
X-MC-Unique: 7t9vgx3TMpShWiyyyJmy6Q-1
Received: by mail-wm1-f70.google.com with SMTP id z62-20020a1c65410000b0290179bd585ef9so1485285wmb.7
        for <nbd@other.debian.org>; Wed, 26 May 2021 22:23:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kMolLnDEuKlCbbgIOvjZGGBzK5WYRhCAHto1CLY+p8s=;
        b=cX3HvCZwNsV3bG8l9U1iIPG9prbq3n6I900p1HxMqgXhqvm5MY9nAGZ6CwM00pSNt1
         fbctTC3uM/RicK5lXVK8pYdT5yX5BKHN8fLjUBSYkTF2dis2zS5H4a7RHCmBCgAb5YGC
         vcioCwVvq9AB23HeYhdbnEygsrH8aK6lpi+Tv815+jH0rNA2Ujjl5z+TpDo0EYygi3An
         SSKy+talt31vjNRPztSvfxdfuJ2KMxn6qNxjxChngPYyfxhfSYD/nyom7xxMclkiGA5R
         LodQ2jm5odE61M1rFrwtV/x/xOh/0Z5Yz/VgnqJlbv3LNIzDEsJkkQyVbP5xmEvKUdz+
         VNMw==
X-Gm-Message-State: AOAM531rN8LgrR6fryNKb4HxXIeHRo95n1+95PQBN78psnQV3XfPOrOy
	lPZ94Jdpx4fhLfMAjVhz7BTn4VxDMEHo6e5O2LkuSnhP0JAfsX5gwChJzlrN9Juj/28CYcMyBZT
	quLblZDVaqHnTbt5TroYmMEoo95llWg==
X-Received: by 2002:a7b:c3d4:: with SMTP id t20mr1475253wmj.13.1622092982523;
        Wed, 26 May 2021 22:23:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwa0wPCCjw27Z2yCH+wdxntKMt6SKdiBQRynFGJITdQ1ITjKHgkP1NlgNUqPttT4t/L9oT/b35YZi6UHzeV/LA=
X-Received: by 2002:a7b:c3d4:: with SMTP id t20mr1475236wmj.13.1622092982195;
 Wed, 26 May 2021 22:23:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210429102828.31248-1-prasanna.kalever@redhat.com>
 <YKMKdHPFCNhR1SXx@T590> <CANwsLLH0HyZ-VGPMc+VmuLivG1fiZHnSqUyLx3UWb76ZMCgYSg@mail.gmail.com>
 <CAFnufp3ZzrKHiV1Vy9_bAymy0oEr288dL4yWo4EjqUzhJV6J-A@mail.gmail.com> <CAFnufp0V7X_nvN3RGK-C0AXappQ+qjMS_rb7iQhcjT8E0OVpzA@mail.gmail.com>
In-Reply-To: <CAFnufp0V7X_nvN3RGK-C0AXappQ+qjMS_rb7iQhcjT8E0OVpzA@mail.gmail.com>
From: Prasanna Kalever <pkalever@redhat.com>
Date: Thu, 27 May 2021 10:52:50 +0530
Message-ID: <CANwsLLEtOws-+X=3CCGzO88poP9NF8uNN8aW9wHOJ+QA=SFH3A@mail.gmail.com>
Subject: Re: [PATCH] nbd: provide a way for userspace processes to identify
 device backends
To: Matteo Croce <mcroce@linux.microsoft.com>
Cc: Ming Lei <ming.lei@redhat.com>, 
	Prasanna Kumar Kalever <prasanna.kalever@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, nbd@other.debian.org, 
	Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, 
	Ilya Dryomov <idryomov@redhat.com>, Xiubo Li <xiubli@redhat.com>, 
	Lennart Poettering <lennart@poettering.net>, Luca Boccassi <bluca@debian.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkalever@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <2xeseq_q0qH.A.Q8H.OCzrgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1169
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CANwsLLEtOws-+X=3CCGzO88poP9NF8uNN8aW9wHOJ+QA=SFH3A@mail.gmail.com
Resent-Date: Thu, 27 May 2021 05:39:26 +0000 (UTC)

On Wed, May 26, 2021 at 7:44 PM Matteo Croce <mcroce@linux.microsoft.com> wrote:
>
> On Wed, May 19, 2021 at 4:33 PM Matteo Croce <mcroce@linux.microsoft.com> wrote:
> >
> > On Tue, May 18, 2021 at 9:52 AM Prasanna Kalever <pkalever@redhat.com> wrote:
> > > > BTW, loop has similar issue, and patch of 'block: add a sequence number to disks'
> > > > is added for addressing this issue, what do you think of that generic
> > > > approach wrt. this nbd's issue? such as used the exposed sysfs sequence number
> > > > for addressing this issue?
> > > >
> > > > https://lore.kernel.org/linux-block/YH81n34d2G3C4Re+@gardel-login/#r
> > >
> > > If I understand the changes and the background of the fix correctly, I
> > > think with that fix author is trying to monotonically increase the seq
> > > number and add it to the disk on every single device map/attach and
> > > expose it through the sysfs, which will help the userspace processes
> > > further to correlate events for particular and specific devices that
> > > reuse the same loop device.
> > >
> >
> > Yes, but nothing prevents to use diskseq in nbd, and increase it on reconfigure.
> > That would allow to detect if the device has been reconfigured.
> >
> > Regards,
> > --
> > per aspera ad upstream
>
> FYI: I just sent a v2 of the diskseq change
>
> https://lore.kernel.org/linux-block/20210520135622.44625-1-mcroce@linux.microsoft.com/

Thanks, Matteo, I will take a look.

Just to set the expectation here, I don't have any thoughts on
leverage the diskseq number for nbd as part of this patch. This patch
is trying to solve a different problem which is more severe for us
than helping to identify the reconfigured events.

That all said, once diskseq patches are merged, I will surely open a
new patch with the required changes in nbd, to leverage diskseq
number.

Best Regards,
--
Prasanna

>
> --
> per aspera ad upstream
>

