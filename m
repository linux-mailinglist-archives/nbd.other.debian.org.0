Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 318E8AD04F6
	for <lists+nbd@lfdr.de>; Fri,  6 Jun 2025 17:15:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0D61D206F8; Fri,  6 Jun 2025 15:15:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jun  6 15:15:10 2025
Old-Return-Path: <yizhan@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 381F5205B8
	for <lists-other-nbd@bendel.debian.org>; Fri,  6 Jun 2025 14:57:13 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.103 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-2.907, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MD5_SHA1_SUM=-1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
	RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id XNJQrDDSlprk for <lists-other-nbd@bendel.debian.org>;
	Fri,  6 Jun 2025 14:57:06 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 1CEFA205DE
	for <nbd@other.debian.org>; Fri,  6 Jun 2025 14:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749221821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nbe1K1n6EnoNpJDeM1+H0VVygYl65ltcXFDiurkXp0I=;
	b=QTnNta4VnZqfaKq1H20ZF9e7ZMMwg469e4C/eKjw38Uc0USP8Xa4mc8Sf/YKuc/fmBr94f
	kFrj4g4tR5HXNuN4FQu4wjyt2nPapRy/GLg/0WVT58e2XsULvRJuMqV/I5/bYzya0n3cdg
	ix4yNoP5dOWeJNMnRPyn/Z2t90A449M=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-e6W-4QhkNve1j176XXo8AQ-1; Fri, 06 Jun 2025 10:25:40 -0400
X-MC-Unique: e6W-4QhkNve1j176XXo8AQ-1
X-Mimecast-MFC-AGG-ID: e6W-4QhkNve1j176XXo8AQ_1749219938
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-32ac7176fc6so11762071fa.2
        for <nbd@other.debian.org>; Fri, 06 Jun 2025 07:25:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749219938; x=1749824738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nbe1K1n6EnoNpJDeM1+H0VVygYl65ltcXFDiurkXp0I=;
        b=IzFJujWwPrwEIXzb90NsfCXLPeGB3iHaqTKNNLpd2MtShz/7TlIcFeOWCBTXU1fTum
         yV0l+fpbi40brB3UTqOCV5X25FYOo/JdYQtGSB9anYvFm89Eg/IwJKRs1NHUW5hBkCKk
         dz13Iigz47Gk63B4dxpjafsjM5UTdglyDEo9/jrdMsfao0g25QQd0BvT5qAo2T/GmNMq
         PVwOAo8Xx2WwMtFIPZOkHGQc4r7Pn+LVCHHoeMyjc428n+w/65QHyrIA/YNDEUJFu7kV
         GpbQM6tyazXN3qSvhQD9kj5iadJC6iiXj069dJSp6Ycc75rLIRBUa0uFsjgtv7aTfGfT
         +xTw==
X-Forwarded-Encrypted: i=1; AJvYcCW//GLAZrQBCa9Ns0cE1jARKZP49ZotNKo8M3epv+AyaIGEx/hENqbahXuxDA8XHLOTVig=@other.debian.org
X-Gm-Message-State: AOJu0Yx9iNqbfId7XlxtHJbfEnKCyIP2ezuspiYCIKbRyhynQajO5yF1
	AePtraMfx75p2lfcsmZucQpu+8kZUBeg6rKW6161jKl9TiM/0T5Qo3SiR8l1s6XfnwY4h5TOthV
	GTtMzYRe/Ru/eG/A2IgLeucC/WRWRTetYjKaXbSkx4RN9oaNWuzXSGxZ3hB6XqYk5n5bq8bw30h
	uu1sT1s90xjmg/Bx1kOoDa7+AbWwya1A==
X-Gm-Gg: ASbGnctkT5QdxWG0fdRrQHWxi8Ro9Am53TDO53APkn9obXd+xy/bnYlMkoDms0ryxHt
	1p41AW/zRbKhw2IXHoZ+ODIx+SP+JdxPTWT7z6mVQY1t7cIXYZePPmj0cwWAP4rxtkqhdiw==
X-Received: by 2002:a05:651c:a0a:b0:32a:ec98:e144 with SMTP id 38308e7fff4ca-32aec98e7b9mr2665411fa.15.1749219938107;
        Fri, 06 Jun 2025 07:25:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXglcxl80BE482xq4dx91qTebsclNfPlMg1sw20ymT3/ZEh0z8jxknKBzXzbqnEY78ZQMjNrsOPiXqzhYfTLw=
X-Received: by 2002:a05:651c:a0a:b0:32a:ec98:e144 with SMTP id
 38308e7fff4ca-32aec98e7b9mr2665271fa.15.1749219937714; Fri, 06 Jun 2025
 07:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <2xsfqvnntjx5iiir7wghhebmnugmpfluv6ef22mghojgk6gilr@mvjscqxroqqk>
 <7cdceac2-ef72-4917-83a2-703f8f93bd64@flourine.local> <rcirbjhpzv6ojqc5o33cl3r6l7x72adaqp7k2uf6llgvcg5pfh@qy5ii2yfi2b2>
In-Reply-To: <rcirbjhpzv6ojqc5o33cl3r6l7x72adaqp7k2uf6llgvcg5pfh@qy5ii2yfi2b2>
From: Yi Zhang <yi.zhang@redhat.com>
Date: Fri, 6 Jun 2025 22:25:25 +0800
X-Gm-Features: AX0GCFuL4XNUJVJ0lfr1A30P6N_O92q6LMT8TriVlRQc68jUCEDZAsCtx8zBrpc
Message-ID: <CAHj4cs8SqXUpbT49v29ugG1Q36g5KrGAHtHu6sSjiH19Ct_vJA@mail.gmail.com>
Subject: Re: blktests failures with v6.15 kernel
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>, Daniel Wagner <dwagner@suse.de>
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, 
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>, 
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "nbd@other.debian.org" <nbd@other.debian.org>, 
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, Tomas Bzatek <tbzatek@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EiLjYJPtIawggTGbD65ppYtAoJROjt5txhTI0a9nWaw_1749219938
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Xn5i0rVJkoN.A.yXsG.-XwQoB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3384
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAHj4cs8SqXUpbT49v29ugG1Q36g5KrGAHtHu6sSjiH19Ct_vJA@mail.gmail.com
Resent-Date: Fri,  6 Jun 2025 15:15:11 +0000 (UTC)

On Fri, Jun 6, 2025 at 3:55=E2=80=AFPM Shinichiro Kawasaki
<shinichiro.kawasaki@wdc.com> wrote:
>
> To+: Yi,
>
> On Jun 05, 2025 / 15:02, Daniel Wagner wrote:
> > Hi,
>
> Hi Daniel, thank you for the fix actions!
>
> >
> > On Thu, May 29, 2025 at 08:46:35AM +0000, Shinichiro Kawasaki wrote:
> > > #1: nvme/023
> > >
> > >     When libnvme has version 1.13 or later and built with liburing, n=
vme-cli
> > >     command "nvme smart-log" command fails for namespace block device=
s. This
> > >     makes the test case nvme/032 fail [2]. Fix in libnvme is expected=
.
> > >
> > >     [2]
> > >     https://lore.kernel.org/linux-nvme/32c3e9ef-ab3c-40b5-989a-7aa323=
f5d611@flourine.local/T/#m6519ce3e641e7011231d955d9002d1078510e3ee
> >
> > Should be fixed now. If you want, I can do another release soon, so the
> > fix get packaged up by the distros.
>
> As of today, CKI project keeps on reporting the failure:
>
>   https://datawarehouse.cki-project.org/kcidb/tests/redhat:1851238698-aar=
ch64-kernel_upt_7
>
> Yi, do you think the new libnvme release will help to silence the failure

I've created one CKI issue to track the nvme/023 failure, so the
failure will be waived in the future test.

> reports? I'm guessing the release will help RedHat to pick up and apply t=
o CKI

Yes, if we have the new release for libnvme, our Fedora libnvme
maintainer can build the new one for Fedora. I also created the Fedora
issue to track it on libnvme side.

https://bugzilla.redhat.com/show_bug.cgi?id=3D2370805

> blktests runs.
>


--
Best Regards,
  Yi Zhang

