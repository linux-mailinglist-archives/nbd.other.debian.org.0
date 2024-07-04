Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7D99274A0
	for <lists+nbd@lfdr.de>; Thu,  4 Jul 2024 13:11:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9A22E20671; Thu,  4 Jul 2024 11:11:33 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jul  4 11:11:33 2024
Old-Return-Path: <fernandez.simon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,LDOSUBSCRIBER,
	LDO_WHITELIST,RCVD_IN_DNSWL_NONE autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1C88520669
	for <lists-other-nbd@bendel.debian.org>; Thu,  4 Jul 2024 11:11:25 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.199 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id PqGQj-NB5_VI for <lists-other-nbd@bendel.debian.org>;
	Thu,  4 Jul 2024 11:11:22 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 7B6CE20670
	for <nbd@other.debian.org>; Thu,  4 Jul 2024 11:11:22 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-367a2c2e41aso57605f8f.2
        for <nbd@other.debian.org>; Thu, 04 Jul 2024 04:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720091479; x=1720696279; darn=other.debian.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwBmB9TZGFjcG5R2+2N2tz93DvezoEGxh6PsIk8IO/w=;
        b=Gvv7jiXPZxkDAaoeIQbeY1dT26dK/38XlFABiwqgQNoik3eccildOkZpFufhL1qfGK
         eVpsTHKDt15kZJZO5FBP1W1rTEZMmb10jdNSZSO/YsCML/BSTjC25elz/5A8SqVL2DXM
         H5dw0d2gRT9ANcOV+67Jc1NGwoi4lYkVuW+Btlqa2MvsF2WUSAxmw25esd9F263DwjRw
         aBIXadFglpipjVoPKwMp1y+k/3pmXU8OS7ihZd9ukA+GdHDj5xt5zjKuOJOfH/y+j+Q4
         VlwM5OXptCgLhJT0Ec2JVKrXKqf2be0P1MGe7WaUMuM59HMACFBylJ/lPYk68HcGgtlY
         VZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720091479; x=1720696279;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qwBmB9TZGFjcG5R2+2N2tz93DvezoEGxh6PsIk8IO/w=;
        b=aEzJNzR8FIRQAObO2w8rfP+AwZO8fZgOFwrlyVfcgc7HKsUUpij6bBIpaROmr/K4FL
         oTH5Zka05o2HcyNmpG84Fmt8fKz4OPZhgGbRwUv6E5ZCmwulx3DwvDLjlf/WsaTXSudG
         RTFesACQd4w6qtO8cfIsMi6Hxh3H6vnt6tyUK8OOvcoAyhvZlyl+9UXO1AJuxRNMfbRH
         a7Lk0LYJ+LZPfijndYjflSf382tTD16eHVx1fpt5C6H+cb1q07b7jWb6J0TWzMAxDiQg
         LaZJMpL/0FHPvQDkbywFhXOTaZZVy1MoEMu03WhAN3YOY3aWGXp9GrQR0wyv6S4lPhOn
         etpw==
X-Forwarded-Encrypted: i=1; AJvYcCWIr4VjJpihF5btLVr6U8KAwxt+xXw3GafVYOnrk08BPjcY+CHnnzkOuhFNE0ZYBLdl3zcaXE+9pFnaYSADIy29CDyj9g==
X-Gm-Message-State: AOJu0YyyeH5sV53vCboRry0UcdZM89Eotkgk4trYQhfNm8iyOTtwGVJh
	I1vJgTDLPBRjT3JlzzhKRarwwrSIneHnR3JTtMxrYNmKrSLnacl4
X-Google-Smtp-Source: AGHT+IFEzvL2jC2faLe/uaMvaq/UCJ26KrH1XFm9Ol6h8w0Rebt6hjx4X+gdY7pIVUfbtqQYexMuPw==
X-Received: by 2002:a5d:5712:0:b0:367:94e7:958a with SMTP id ffacd0b85a97d-3679dd17ec1mr1153338f8f.6.1720091479417;
        Thu, 04 Jul 2024 04:11:19 -0700 (PDT)
Received: from [10.14.0.2] ([139.28.176.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36787db4d12sm6821051f8f.110.2024.07.04.04.11.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Jul 2024 04:11:18 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH 14/26] block: move the nonrot flag to queue_limits
From: Simon Fernandez <fernandez.simon@gmail.com>
In-Reply-To: <ZnmoANp0TgpxWuF-@kbusch-mbp.dhcp.thefacebook.com>
Date: Thu, 4 Jul 2024 12:11:16 +0100
Cc: Christoph Hellwig <hch@lst.de>,
 Jens Axboe <axboe@kernel.dk>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Richard Weinberger <richard@nod.at>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 =?utf-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Josef Bacik <josef@toxicpanda.com>,
 Ming Lei <ming.lei@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alasdair Kergon <agk@redhat.com>,
 Mike Snitzer <snitzer@kernel.org>,
 Mikulas Patocka <mpatocka@redhat.com>,
 Song Liu <song@kernel.org>,
 Yu Kuai <yukuai3@huawei.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-m68k@lists.linux-m68k.org,
 linux-um@lists.infradead.org,
 drbd-dev@lists.linbit.com,
 nbd@other.debian.org,
 linuxppc-dev@lists.ozlabs.org,
 ceph-devel@vger.kernel.org,
 virtualization@lists.linux.dev,
 xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org,
 dm-devel@lists.linux.dev,
 linux-raid@vger.kernel.org,
 linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 nvdimm@lists.linux.dev,
 linux-nvme@lists.infradead.org,
 linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org,
 linux-block@vger.kernel.org,
 Damien Le Moal <dlemoal@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <78BDDF6A-1FC7-4DD7-AABF-E0B055772CBF@gmail.com>
References: <20240617060532.127975-1-hch@lst.de>
 <20240617060532.127975-15-hch@lst.de>
 <ZnmoANp0TgpxWuF-@kbusch-mbp.dhcp.thefacebook.com>
To: Keith Busch <kbusch@kernel.org>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <vZebiGaBQ8C.A.IZPJ.lNohmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3094
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/78BDDF6A-1FC7-4DD7-AABF-E0B055772CBF@gmail.com
Resent-Date: Thu,  4 Jul 2024 11:11:33 +0000 (UTC)

Hi folks, how can I unsubscribe from this group.?
Thanks in advance.
S

> On 24 Jun 2024, at 18:08, Keith Busch <kbusch@kernel.org> wrote:
>=20
> On Mon, Jun 17, 2024 at 08:04:41AM +0200, Christoph Hellwig wrote:
>> -#define blk_queue_nonrot(q)	test_bit(QUEUE_FLAG_NONROT, =
&(q)->queue_flags)
>> +#define blk_queue_nonrot(q)	((q)->limits.features & =
BLK_FEAT_ROTATIONAL)
>=20
> This is inverted. Should be:
>=20
> #define blk_queue_nonrot(q)	(!((q)->limits.features & =
BLK_FEAT_ROTATIONAL))
>=20

