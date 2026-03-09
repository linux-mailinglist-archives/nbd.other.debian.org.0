Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFszBsvrrmlRKAIAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Mon, 09 Mar 2026 16:48:27 +0100
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id A733723C03A
	for <lists+nbd@lfdr.de>; Mon, 09 Mar 2026 16:48:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 25EDD20458; Mon,  9 Mar 2026 15:48:26 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Mar  9 15:48:26 2026
Old-Return-Path: <csander@purestorage.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9FC9E20452
	for <lists-other-nbd@bendel.debian.org>; Mon,  9 Mar 2026 15:31:59 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.2 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MD5_SHA1_SUM=-1,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id n1wdoXv60cgc for <lists-other-nbd@bendel.debian.org>;
	Mon,  9 Mar 2026 15:31:53 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .purestorage. - helo: .mail-ot1-x333.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 570AF20456
	for <nbd@other.debian.org>; Mon,  9 Mar 2026 15:31:53 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-7d74872c5b1so40682a34.2
        for <nbd@other.debian.org>; Mon, 09 Mar 2026 08:31:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773070310; cv=none;
        d=google.com; s=arc-20240605;
        b=jeDyYK+69UBUyC+/lJohDBTsWfJsXdX4XKLfFUdPa/6pmPkoyNuIvPmg+jWmwILid3
         PNds2aDhMBrW9dt7xtHq+176f++8TpuhiJbXsmnmIbR6BWMvoR9lRJQwo+FkTCzcXFl8
         MdXEf0kUfiLSjkSZZ+NaGpABHu9l+yzqNp+droeNyKs7BhkI30/qmdVdCPX2ZJmyKDSe
         6Fymi4/mgNp59aQAusVzTTDmyuBfVW3arxeMPinIcZEy0ThuIBFqaQJqIaM8AqvSYZMi
         YTB1A1/x5OWf3Gobjrd3yJpaI1bZB7ANKpnLUZjyd/7GcPJ7kIgLL1ahft+0aZHoSLOe
         q2bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oeNCYoeh9aVUManQKA2h7rmbYGtX7bI6QzEClpFzvxQ=;
        fh=m1f25vSPuq6t+BVA3pDpAnXVKHWiTipooKPoevlj+i4=;
        b=FFr61yZ2zEMGqxgOkT0NJuRSx/jqOZr2786ll9mrOjN7PmEtL/wtPNJ7tDeD7z8Isf
         OpTfggVmH/gASJc+i/EtUhMdCMK30WUc26gL3Wa3hCxZfRUvFF5WMG6Nby8KIPgGMMMX
         yBLyYntH875sgma3vT6Ts96ell2BFR0BmK4LvDvssGXqKYG8TAqC1BOEjbdfGCG/B1Mh
         tb64I825ULuDqJKlJKDoH+IqovmNuEPOZuoGGYtspHWfrSkcpkvjK3Jb6LE91vPWaz1k
         YzY93cAfgXPdnZSZQiuYBQM1E4EvPHdrOl3/Lvuiv1kYLtDkx6ui9FaFiGC8lOC4AJ+c
         C7pw==;
        darn=other.debian.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1773070310; x=1773675110; darn=other.debian.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oeNCYoeh9aVUManQKA2h7rmbYGtX7bI6QzEClpFzvxQ=;
        b=DfEl5clniSjmQJi4Xd9BOO1WIGMFzZfnEOKROZdKYDVZhApkmiADZo+iijb1Nuq2gp
         PO5d84cE+BgwbCtrn3FGbQXoOGR8VdP3vjXFGRlbcorcG3PAhvbePBsg6SWVKtYRXzbQ
         JUBFKQe523Tmjmatu675ARLU+7HLH8kJkIRvBsPrlHvMVrWKt1Zg36skcYXAm8tRiRzj
         48yNkUni7M6BqUvqDI3RJYY8ByX3gxKfXGLGtk2EpwMdqI617UVHhELATVCZkyOIhJf5
         0rTUe5o6EXyJVqucV3ILqasjLzH6r3TkmdODL2o6POfpEuQRmKISwUGW86BDIS7zQ4D/
         1kTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773070310; x=1773675110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oeNCYoeh9aVUManQKA2h7rmbYGtX7bI6QzEClpFzvxQ=;
        b=T6UOTqz65YWSBgNs8mp5cep7BAmv+HKCFqOIWiqAeSwfAieM12COI2uAeUvLDhOBL9
         UpkkXycBpUPEDNhXEODl35x9eYyJxt05QbTn4eW6nG9NzB4hRGMNfVJcMhymElihXjaq
         vanzjuKXjFFBCYgYJ7QBImmU8cdbs0Ijp2SxS01RrlQgBlEjhDreirbxmngnuC+x6JgY
         /MVDpFGt6UAiEmHjpOoxwkQa8l7/ft8+V4RL4uw7SGwaSLuT66v95dnG+SaNeXj7JWzl
         nZkadsCEa3BDy3esDZq1tggfEUWxri06buAtZVnfksYsCejg4o+4mlTnJ9RO+1MxlffN
         pfOA==
X-Forwarded-Encrypted: i=1; AJvYcCU2oL0mh0qq/gUIEvuMe/hJIhSqUh4I9HQzJHAKqW9Eucq+LftDXT2Qsher7vuifenKwQ4=@other.debian.org
X-Gm-Message-State: AOJu0Yw5bTdRLmDPBHKra8MVHGG1U+tPN3Cron7J7moq7oUvjfgEUM0V
	GJ3oNLGdU5eu4aJx+wY2d1vY0uj/pVtDKLqAw9lBQsJBl+bAy6M7JF81qaCuH03ucpwPC9ffqJL
	O/KAhSEDeGcf0zNJj0GOAIzqfy9zNSljOMcBwPeTdaA==
X-Gm-Gg: ATEYQzyugovClVhrr/tJgIcjmNA0mNjm0sLPT3Kx9UnThfvR87wTAQ5i53fJIMgSPEs
	UAum7uJvmmRX9yYQh4tBy5/cBQ/CXvx8o9DofPgq5bUvglxrEhxb2wVoXIuFmtlf8oRasR6Ra5I
	PJHkrG1fbMJC5/O1lhmYyjltSn0jjohWmBIAM4En2cwv1/vOISo7YGNfXWkXvFBnvo2+QtFJfaj
	yEe9UkLgea9FybbvPf1wvFt/xrZRFefI5j2hcBdpn1XpFF+PVj/wJWoLsat39sb3mKh2XxVylKg
	lDSAHEhqTxXVJnWckA==
X-Received: by 2002:a05:6830:4486:b0:7d7:4cf3:76eb with SMTP id
 46e09a7af769-7d74cf37b02mr2194872a34.4.1773070309370; Mon, 09 Mar 2026
 08:31:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260309062840.2937858-2-iam@sung-woo.kim> <202603090911.0DdOwjTR-lkp@intel.com>
In-Reply-To: <202603090911.0DdOwjTR-lkp@intel.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Mon, 9 Mar 2026 08:31:38 -0700
X-Gm-Features: AaiRm52Z14MD0OSGkRezE5rp23B4YvHF_3hxCrYP4X9p-5DR-qWhmespFt1uSGc
Message-ID: <CADUfDZqBZWwy+6XOde_aZTwLisRP8j5qRqB6X_EJJPr+wmdGZQ@mail.gmail.com>
Subject: Re: [PATCH] blk-mq: nvme: Fix general protection fault in nvme_setup_descriptor_pools()
To: kernel test robot <lkp@intel.com>
Cc: Sungwoo Kim <iam@sung-woo.kim>, Jens Axboe <axboe@kernel.dk>, 
	Josef Bacik <josef@toxicpanda.com>, Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
	Mikulas Patocka <mpatocka@redhat.com>, dm-devel@lists.linux.dev, 
	Ulf Hansson <ulf.hansson@linaro.org>, Richard Weinberger <richard@nod.at>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, James Smart <james.smart@broadcom.com>, 
	Chaitanya Kulkarni <kch@nvidia.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, oe-kbuild-all@lists.linux.dev, 
	Chao Shi <cshi008@fiu.edu>, Weidong Zhu <weizhu@fiu.edu>, Dave Tian <daveti@purdue.edu>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nbd@other.debian.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <fS7BSamnrIE.A.xNgO.KvurpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3513
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CADUfDZqBZWwy+6XOde_aZTwLisRP8j5qRqB6X_EJJPr+wmdGZQ@mail.gmail.com
Resent-Date: Mon,  9 Mar 2026 15:48:26 +0000 (UTC)
X-Rspamd-Queue-Id: A733723C03A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.51 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	R_DKIM_ALLOW(-0.20)[purestorage.com:s=google2022];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:lkp@intel.com,m:iam@sung-woo.kim,m:axboe@kernel.dk,m:josef@toxicpanda.com,m:agk@redhat.com,m:snitzer@kernel.org,m:mpatocka@redhat.com,m:dm-devel@lists.linux.dev,m:ulf.hansson@linaro.org,m:richard@nod.at,m:miquel.raynal@bootlin.com,m:vigneshr@ti.com,m:marcan@marcan.st,m:sven@svenpeter.dev,m:alyssa@rosenzweig.io,m:kbusch@kernel.org,m:hch@lst.de,m:sagi@grimberg.me,m:james.smart@broadcom.com,m:kch@nvidia.com,m:jejb@linux.ibm.com,m:martin.petersen@oracle.com,m:oe-kbuild-all@lists.linux.dev,m:cshi008@fiu.edu,m:weizhu@fiu.edu,m:daveti@purdue.edu,m:linux-block@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:nbd@other.debian.org,m:linux-mmc@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:asahi@lists.linux.dev,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[csander@purestorage.com,bounce-nbd=lists@other.debian.org];
	R_SPF_NA(0.00)[no SPF record];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	DKIM_TRACE(0.00)[purestorage.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[csander@purestorage.com,bounce-nbd=lists@other.debian.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_DNSFAIL(0.00)[purestorage.com : server fail];
	NEURAL_HAM(-0.00)[-0.954];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:8365, ipnet:2001:41b8::/29, country:DE];
	TAGGED_RCPT(0.00)[nbd];
	DBL_BLOCKED_OPENRESOLVER(0.00)[purestorage.com:dkim,mail.gmail.com:mid,01.org:url,git-scm.com:url,intel.com:email]
X-Rspamd-Action: no action

On Mon, Mar 9, 2026 at 1:42=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Sungwoo,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on axboe/for-next]
> [also build test ERROR on device-mapper-dm/for-next linus/master v6.16-rc=
1 next-20260306]
> [cannot apply to linux-nvme/for-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Sungwoo-Kim/blk-mq=
-nvme-Fix-general-protection-fault-in-nvme_setup_descriptor_pools/20260309-=
143107
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git f=
or-next
> patch link:    https://lore.kernel.org/r/20260309062840.2937858-2-iam%40s=
ung-woo.kim
> patch subject: [PATCH] blk-mq: nvme: Fix general protection fault in nvme=
_setup_descriptor_pools()
> config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/202=
60309/202603090911.0DdOwjTR-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260309/202603090911.0DdOwjTR-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603090911.0DdOwjTR-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> error[E0308]: mismatched types
>    --> rust/kernel/block/mq/operations.rs:274:28
>    |
>    274 |         init_request: Some(Self::init_request_callback),
>    |                       ---- ^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected fn p=
ointer, found fn item
>    |                       |
>    |                       arguments to this enum variant are incorrect
>    |
>    =3D note: expected fn pointer `unsafe extern "C" fn(_, _, _, i32) -> _=
`
>    found fn item `unsafe extern "C" fn(_, _, _, u32) -> _ {block::mq::ope=
rations::OperationsVTable::<T>::init_request_callback}`
>    help: the type constructed contains `unsafe extern "C" fn(*mut binding=
s::blk_mq_tag_set, *mut bindings::request, u32, u32) -> i32 {block::mq::ope=
rations::OperationsVTable::<T>::init_request_callback}` due to the type of =
the argument passed

Looks like the type of _numa_node in the signature of
init_request_callback() needs to be updated accordingly from c_uint to
c_int.

Best,
Caleb


>    --> rust/kernel/block/mq/operations.rs:274:23
>    |
>    274 |         init_request: Some(Self::init_request_callback),
>    |                       ^^^^^---------------------------^
>    |                            |
>    |                            this argument influences the type of `Som=
e`
>    note: tuple variant defined here
>    --> /opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x8=
6_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/option.rs:597:=
5
>    |
>    597 |     Some(#[stable(feature =3D "rust1", since =3D "1.0.0")] T),
>    |     ^^^^
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>

