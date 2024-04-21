Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 639EA8ABF42
	for <lists+nbd@lfdr.de>; Sun, 21 Apr 2024 15:18:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 09C3A20C56; Sun, 21 Apr 2024 13:18:15 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Apr 21 13:18:14 2024
Old-Return-Path: <yizhan@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 948B120BFE
	for <lists-other-nbd@bendel.debian.org>; Sun, 21 Apr 2024 13:01:08 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.575 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-2.355, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
	RCVD_IN_MSPIKE_WL=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 4RUiIOovHAO1 for <lists-other-nbd@bendel.debian.org>;
	Sun, 21 Apr 2024 13:01:00 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 515A020BF7
	for <nbd@other.debian.org>; Sun, 21 Apr 2024 13:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713704455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sy/e6b7EdMkat/b8vNzmnm5808mkzwgEft7nfqfXnys=;
	b=AFQlkP0CRY59dQa+jcrBe1BS65uxndVwdQG8rw1HDqvVHXvjTu/WMN6YjcRg9grd/F761e
	fAmCrTQcSwdYlIWJc9oXtkBFULoFpchJT4dvvIAR8gbpNOLxm59wYHuh90I3j/+fo6OWbP
	yYlIvXAz6wtRXWL9S4lDasF/2Y0pl3A=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-Yx76QQp4PHKjCp53nlWP3Q-1; Sun, 21 Apr 2024 08:29:30 -0400
X-MC-Unique: Yx76QQp4PHKjCp53nlWP3Q-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2acf6bce4cfso1027685a91.0
        for <nbd@other.debian.org>; Sun, 21 Apr 2024 05:29:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713702570; x=1714307370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sy/e6b7EdMkat/b8vNzmnm5808mkzwgEft7nfqfXnys=;
        b=sIQlnNNDXKiLxlf9Ao3CYK9EiS0MLrzlQcQDkj0wMMRvcq3s5SNBIM0oyOpZ8ZUltn
         /ex5GEzl5MELn75kVujq3opy6CFwRgkYDRtjSf38cG/rhL4Vx9dp0tJZNJS9yIReTrfq
         eRLjlI2nOJJoWHDqgNapUirSoCcJTvsgCsRKxs3BTKk7lY4o40+E/jaG1hsbvPek8jPJ
         2A8ki8gjq4qUVJINlqi3lKSYWcKND4ThX2aYYYaj3RlQ494RZ072QBKuCyoKyI6inRaM
         0jOqqPxBB1NGzE43G4Rpn7sQzb8zKX6niMxAhErq0OAaDBk06QGv0vYSKnRob2RNHVHY
         7HhA==
X-Forwarded-Encrypted: i=1; AJvYcCVZp9RARpN20jbcLUxBUJby7NSNPYeGYVjS1h41NNESLqwOaWToxxGN2ddzRGurT9SDNxIJZijCTxTlg80sIM/pImRVxQ==
X-Gm-Message-State: AOJu0YwQlSUpdXTCb4yGWKtJtdiovLiiRdC0bG+Bfrp5CpjhyAT2iPpc
	yJtY6hm5CHnRvzYgVDYuX+rVTsiC9gPqffK+Lh67J7sSpkEdk+qE3h+OPG/SKxzzdNf3ArQ5pH8
	dWFCpUZr30bLeV9JdPUsvHx+zhT1bqkq3OFO8JIDpWJaewZ8O1w54sd40tCE+Zog40WhwqKZnfw
	opvlkZaYjcu+8BRlyvNBFN/WmQBQ==
X-Received: by 2002:a17:90a:4a06:b0:2ac:3af6:915b with SMTP id e6-20020a17090a4a0600b002ac3af6915bmr10220352pjh.1.1713702569955;
        Sun, 21 Apr 2024 05:29:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGT7eZW8lEWSiEo0FoLUFrm4oGZmz7Fw072WAlSkG/kq2pWvC0ypTtHzT6DMUZX+8SH2CZJpOcNjrJFE4dPB7M=
X-Received: by 2002:a17:90a:4a06:b0:2ac:3af6:915b with SMTP id
 e6-20020a17090a4a0600b002ac3af6915bmr10220338pjh.1.1713702569603; Sun, 21 Apr
 2024 05:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240417104209.2898526-1-shinichiro.kawasaki@wdc.com>
In-Reply-To: <20240417104209.2898526-1-shinichiro.kawasaki@wdc.com>
From: Yi Zhang <yi.zhang@redhat.com>
Date: Sun, 21 Apr 2024 20:29:17 +0800
Message-ID: <CAHj4cs9W1Ad7Q8axcbDd4tsuPPz3MBxGGqCNPT6efbkgCnGMwA@mail.gmail.com>
Subject: Re: [PATCH blktests v2 0/2] fix nbd/002
To: "Shin'ichiro Kawasaki" <shinichiro.kawasaki@wdc.com>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org, 
	Josef Bacik <josef@toxicpanda.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <-IKQPqFbDsM.A.VYH.WIRJmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2795
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAHj4cs9W1Ad7Q8axcbDd4tsuPPz3MBxGGqCNPT6efbkgCnGMwA@mail.gmail.com
Resent-Date: Sun, 21 Apr 2024 13:18:15 +0000 (UTC)

Cannot reproduce the failure within 10000 cycles test now, thanks.

Tested-by: Yi Zhang <yi.zhang@redhat.com>




On Wed, Apr 17, 2024 at 6:42=E2=80=AFPM Shin'ichiro Kawasaki
<shinichiro.kawasaki@wdc.com> wrote:
>
> Recently, CKI project found blktests nbd/002 failure. The test case sets =
up the
> connection to the nbd device, then checks partition existence in the devi=
ce to
> confirm that the kernel reads the partition table in the device. Usually,=
 this
> partition read by kernel is completed before the test script checks the
> partition existence. However, the partition read often completes after th=
e
> partition existence check, then the test case fails. I think the test scr=
ipt
> checks the partition existence too early, and this should be fixed in the=
 test
> script.
>
> During this investigation, I noticed that the test case nbd/002 handles t=
he
> ioctl interface and the netlink interface opposite. The first patch fixes=
 this
> wrong interface handling. The second patch addresses the too early partit=
ion
> existence check issue.
>
> Link to v1 patch: https://lore.kernel.org/linux-block/20240319085015.3901=
051-1-shinichiro.kawasaki@wdc.com/
>
> Changes from v1:
> * Added another patch to fix ioctl/netlink interface handling mistake
> * Avoid the nbd/002 failure by repeating the partition existence check
>
> Shin'ichiro Kawasaki (2):
>   nbd/002: fix wrong -L/-nonetlink option usage
>   nbd/002: repeat partition existence check for ioctl interface
>
>  tests/nbd/002 | 26 ++++++++++++++++++--------
>  1 file changed, 18 insertions(+), 8 deletions(-)
>
> --
> 2.44.0
>


--
Best Regards,
  Yi Zhang

