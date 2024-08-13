Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B15C894FF1B
	for <lists+nbd@lfdr.de>; Tue, 13 Aug 2024 09:54:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 565D22056A; Tue, 13 Aug 2024 07:54:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Aug 13 07:54:10 2024
Old-Return-Path: <yizhan@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 59B9F2056A
	for <lists-other-nbd@bendel.debian.org>; Tue, 13 Aug 2024 07:38:26 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.099 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Fh_5cThDkrAd for <lists-other-nbd@bendel.debian.org>;
	Tue, 13 Aug 2024 07:38:20 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 7539C20564
	for <nbd@other.debian.org>; Tue, 13 Aug 2024 07:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723534695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GLMXoEnXQB4j6uGPV4owlqBBJTVhrRaJGaY0tIh4Xwc=;
	b=RMkvm4Rvuc823elvCslqmlVrh2sMQ6gH+qRv/CBL40/gFl4YJRYInklXE/UWtrqCETsd2w
	I74Ux4WKpw4B9EJPFuhYBYBFSmVgvkvN8hSpqhv69BfURtRi0AxY3J6duzlF8SGENtQRcf
	SCPztwEpJKb8JTEBWBEGv9UhKOX9QsM=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-JKhBRXveN3WIHF0lWxF_ng-1; Tue, 13 Aug 2024 03:06:46 -0400
X-MC-Unique: JKhBRXveN3WIHF0lWxF_ng-1
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-70f0a00eb16so3578789b3a.1
        for <nbd@other.debian.org>; Tue, 13 Aug 2024 00:06:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723532805; x=1724137605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GLMXoEnXQB4j6uGPV4owlqBBJTVhrRaJGaY0tIh4Xwc=;
        b=w25a7uN1dy2d4prKcEErdK5Yl2U5aQVbtlItoqzlasW6ve+wlw4u/QvcBz52ZJcW8V
         3AeVo05k9yhjPDyYl94tc4dyc0K8h1OD7OEeZu1bXaAm6/4B6PIjGHCSkhPeAOYw6FVh
         Z8d3IabDrQ6eRdB6vf/oMOGxBO2+cSBBXxpfDfu2sZCGfdBOSTPOp+EAUIHUUipLqcfl
         KcJEgTPC2Wr2eLUC6XAcI7FY6vIMliVoyPSgEnnNBiLZKkQmPt1K7jtuP+HnbEUJSURh
         MpMx+DODxvNxHJol8YVzgrNGwk2/4GNibWFXpnV7x2TX21md/FaRckx4wHukPsfJBKaj
         9EBw==
X-Forwarded-Encrypted: i=1; AJvYcCUhKCLW6YnFto0JpQfuz337fvVWw/C1X7/+HFbC8puUomeQhIdJ7MjIDdDYOpjEcgdNf1sWC/S7M9TMLjAUbMzKWBjAmg==
X-Gm-Message-State: AOJu0Yw0K/W+LfWfVnagl/pK+/sbluyCR4cI5XmSnyxjcJ9Pp7kDzsF5
	Hf7276owyJSmg8QpjoFvEHnfOmwZQQYbaBM+sYRWluuZvpsOQzq7Pr0dBBYXCs6XRWw1ES2LBOE
	TlrWUh03C8elPUrMJT9c6keesDqcvV0i2MfQbts4MK4ypkC9J7jDcscOGR+VZACv9yf2uD7V7P3
	1UV02HmAJOGEzrWKJUZI1xcIsp/A==
X-Received: by 2002:a05:6a21:6b0c:b0:1c6:fc2f:40fa with SMTP id adf61e73a8af0-1c8d75c7c32mr3359009637.46.1723532805245;
        Tue, 13 Aug 2024 00:06:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4Sin0HKC9rjncXAyssbzbIMN1oJ/7IXsRidBfNy79BEr7HzyhaxZkC41l5rDTmBxwrSBe3UGPw42vPbsazvE=
X-Received: by 2002:a05:6a21:6b0c:b0:1c6:fc2f:40fa with SMTP id
 adf61e73a8af0-1c8d75c7c32mr3358990637.46.1723532804789; Tue, 13 Aug 2024
 00:06:44 -0700 (PDT)
MIME-Version: 1.0
References: <5yal5unzvisrvfhhvsqrsqgu4tfbjp2fsrnbuyxioaxjgbojsi@o2arvhebzes3>
 <ab363932-ab3d-49b1-853d-7313f02cce9e@linux.ibm.com> <ljqlgkvhkojsmehqddmeo4dng6l3yaav6le2uslsumfxivluwu@m7lkx3j4mkkw>
 <79a7ec0d-c22d-44cf-a832-13da05a1fcbd@linux.ibm.com>
In-Reply-To: <79a7ec0d-c22d-44cf-a832-13da05a1fcbd@linux.ibm.com>
From: Yi Zhang <yi.zhang@redhat.com>
Date: Tue, 13 Aug 2024 15:06:32 +0800
Message-ID: <CAHj4cs-5DPDFuBzm3aymeAi6UWHhgXSYsgaCACKbjXp=i0SyTA@mail.gmail.com>
Subject: Re: blktests failures with v6.11-rc1 kernel
To: Nilay Shroff <nilay@linux.ibm.com>
Cc: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>, 
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, 
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>, 
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "nbd@other.debian.org" <nbd@other.debian.org>, 
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <QGgaDpEalT.A.h-BB.iExumB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3138
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAHj4cs-5DPDFuBzm3aymeAi6UWHhgXSYsgaCACKbjXp=i0SyTA@mail.gmail.com
Resent-Date: Tue, 13 Aug 2024 07:54:10 +0000 (UTC)

On Sat, Aug 3, 2024 at 12:49=E2=80=AFAM Nilay Shroff <nilay@linux.ibm.com> =
wrote:
>
>
>
> On 8/2/24 18:04, Shinichiro Kawasaki wrote:
> > CC+: Yi Zhang,
> >
> > On Aug 02, 2024 / 17:46, Nilay Shroff wrote:
> >>
> >>
> >> On 8/2/24 14:39, Shinichiro Kawasaki wrote:
> >>>
> >>> #3: nvme/052 (CKI failure)
> >>>
> >>>    The CKI project reported that nvme/052 fails occasionally [4].
> >>>    This needs further debug effort.
> >>>
> >>>   nvme/052 (tr=3Dloop) (Test file-ns creation/deletion under one subs=
ystem) [failed]
> >>>       runtime    ...  22.209s
> >>>       --- tests/nvme/052.out        2024-07-30 18:38:29.041716566 -04=
00
> >>>       +++ /mnt/tests/gitlab.com/redhat/centos-stream/tests/kernel/ker=
nel-tests/-/archive/production/kernel-tests-production.zip/storage/blktests=
/nvme/nvme-loop/blktests/results/nodev_tr_loop/nvme/052.out.bad     2024-07=
-30 18:45:35.438067452 -0400
> >>>       @@ -1,2 +1,4 @@
> >>>        Running nvme/052
> >>>       +cat: /sys/block/nvme1n2/uuid: No such file or directory
> >>>       +cat: /sys/block/nvme1n2/uuid: No such file or directory
> >>>        Test complete
> >>>
> >>>    [4] https://datawarehouse.cki-project.org/kcidb/tests/13669275
> >>
> >> I just checked the console logs of the nvme/052 and from the logs it's
> >> apparent that all namespaces were created successfully and so it's str=
ange
> >> to see that the test couldn't access "/sys/block/nvme1n2/uuid".
> >
> > I agree that it's strange. I think the "No such file or directory" erro=
r
> > happened in _find_nvme_ns(), and it checks existence of the uuid file b=
efore
> > the cat command. I have no idea why the error happens.
> >
> Yes exactly, and these two operations (checking the existence of uuid
> and cat command) are not atomic. So the only plausible theory I have at t=
his
> time is "if namespace is deleted after checking the existence of uuid but
> before cat command is executed" then this issue may potentially manifests=
.
> Furthermore, as you mentioned, this issue is seen on the test machine
> occasionally, so I asked if there's a possibility of simultaneous blktest
> or some other tests running on this system.

There are no simultaneous tests during the CKI tests running.
I reproduced the failure on that server and always can be reproduced
within 5 times:
# sh a.sh
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D0
nvme/052 (tr=3Dloop) (Test file-ns creation/deletion under one subsystem) [=
passed]
    runtime  21.496s  ...  21.398s
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D1
nvme/052 (tr=3Dloop) (Test file-ns creation/deletion under one subsystem) [=
failed]
    runtime  21.398s  ...  21.974s
    --- tests/nvme/052.out 2024-08-10 00:30:06.989814226 -0400
    +++ /root/blktests/results/nodev_tr_loop/nvme/052.out.bad
2024-08-13 02:53:51.635047928 -0400
    @@ -1,2 +1,5 @@
     Running nvme/052
    +cat: /sys/block/nvme1n2/uuid: No such file or directory
    +cat: /sys/block/nvme1n2/uuid: No such file or directory
    +cat: /sys/block/nvme1n2/uuid: No such file or directory
     Test complete
# uname -r
6.11.0-rc3
[root@hpe-rl300gen11-04 blktests]# lsblk
NAME                                MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
zram0                               252:0    0     8G  0 disk [SWAP]
nvme0n1                             259:0    0 447.1G  0 disk
=E2=94=9C=E2=94=80nvme0n1p1                         259:1    0   600M  0 pa=
rt /boot/efi
=E2=94=9C=E2=94=80nvme0n1p2                         259:2    0     1G  0 pa=
rt /boot
=E2=94=94=E2=94=80nvme0n1p3                         259:3    0 445.5G  0 pa=
rt
  =E2=94=94=E2=94=80fedora_hpe--rl300gen11--04-root 253:0    0 445.5G  0 lv=
m  /


>
> Thanks,
> --Nilay
>


--=20
Best Regards,
  Yi Zhang

