Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2A1AL9OJsWnkDAAAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Wed, 11 Mar 2026 16:27:15 +0100
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 633262667BB
	for <lists+nbd@lfdr.de>; Wed, 11 Mar 2026 16:27:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 238F72050A; Wed, 11 Mar 2026 15:27:15 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar 11 15:27:15 2026
Old-Return-Path: <yizhan@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id ACBF82050A
	for <lists-other-nbd@bendel.debian.org>; Wed, 11 Mar 2026 15:09:24 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.246 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
	RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.717,
	RCVD_IN_VALIDITY_SAFE_BLOCKED=0.236] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id zOt1Z70FLiJb for <lists-other-nbd@bendel.debian.org>;
	Wed, 11 Mar 2026 15:09:18 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id BDCEA20501
	for <nbd@other.debian.org>; Wed, 11 Mar 2026 15:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773241753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eAixbPiqiWKvxfTtqwLl1ZycNxKKR9XvSIdM8Jl9/1M=;
	b=RL5ZMe+scySmI6MzfpFmiQ/AUch0/RAQh9a0i8rQMWqLtLFeFIgLPBaXuTDNIaI70t4Ufg
	9xibD2hWALCC5foT0fcUG7nGEiXieH8+0h0/kCadEYcMLXMJBvNXtBJk97jL2zntaf7NJz
	9Qu/BjBGHDwdUlbixoHB4dymApb2qzs=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-97Qz3CxWMvSAv3PfJz1Vbw-1; Wed, 11 Mar 2026 11:09:12 -0400
X-MC-Unique: 97Qz3CxWMvSAv3PfJz1Vbw-1
X-Mimecast-MFC-AGG-ID: 97Qz3CxWMvSAv3PfJz1Vbw_1773241750
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-38a3dc7d00dso261341fa.1
        for <nbd@other.debian.org>; Wed, 11 Mar 2026 08:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773241750; x=1773846550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eAixbPiqiWKvxfTtqwLl1ZycNxKKR9XvSIdM8Jl9/1M=;
        b=v5krPUkOjTurfbPB/gX2qdPCkmNYWf/1YWSoorYAAllHCSxT8YF97Lm7uzchDTxTY/
         24JrKFq8+hTvVFR7yuoHFmD36v3z/up7L6BjvlQr53kZPECRbE9nj/OLI6JTvj0oMtU5
         dXUsZNQ8buxcBI3OzbHvsRHh0eEy4a2QAYqsyMFEC61+1V7BbKJZzc98agf6+LAzddRb
         y2v+xI3TRQwpb4vnqNXpd4aUERTtXZmTsi9KLXD5WnjvRi3mMifJo5x1EfakqS0rl42A
         J/h+MtjXxl5yTTMZJnf3YMAp5UBOIsFRDpwlRWIZnUXyvDglEYnTj18DdjM0nXPqV/1c
         KUZw==
X-Forwarded-Encrypted: i=1; AJvYcCWvdHRSSMEpk8cqMVBI0RbFjiltdGgdNCKFnyubI1URGRwgHtYBQngTrt2cWI+eY8PqEjA=@other.debian.org
X-Gm-Message-State: AOJu0Yy9b2RtJk5VZGo11ReVYpbniTiSi0pgr3zNxJlbVO6JYhKuzkmo
	vvy+O2g7Ujb4b91Op5QaO3RAoqWm8zlv38WaDvmHCls8VNCTLWoTL93ft+dHnBOWSONcJAHV+CA
	fESLTB4B7P0tq/yPLjnGRSKAcnJKj3S93WpFGdiYbGOlQHJSeeqzRUgMmyWtreojpGRaC65gJBP
	QZvgjB+DfYluXl9lGG7D82oGbC6jtnyA==
X-Gm-Gg: ATEYQzySxeh/jvN4Gwahu/+x3anFX6VpOHaW+B02diWUAAo5s06lvZHedPSjhb+nZEq
	h38Hjo4e6SZef4eoTWMXN55ZpE1v/V3pti4SELXenuTXdMv6RvSBippC1i0mCxxSMP1mPeeyIkq
	tvUSn+TfwmaaOFhZpIUBzuYrTV1WFv18ePEYv+bItQm4JDlXbWBLf8LFkP5AlE7Xrt1ucUCQ3TI
	UIk7X5n1pauSEJzJLia3M1CHyniFXy0UshML9BPsMJIIa8g5lY=
X-Received: by 2002:a05:651c:551:b0:389:ee7b:4d4b with SMTP id 38308e7fff4ca-38a67dd60d3mr11561811fa.12.1773241750311;
        Wed, 11 Mar 2026 08:09:10 -0700 (PDT)
X-Received: by 2002:a05:651c:551:b0:389:ee7b:4d4b with SMTP id
 38308e7fff4ca-38a67dd60d3mr11561701fa.12.1773241749845; Wed, 11 Mar 2026
 08:09:09 -0700 (PDT)
MIME-Version: 1.0
References: <aZ_-cH8euZLySxdD@shinmob> <CAHj4cs8mzSZez+n2qLu5931YAuQ4=RxNt6D6YJCsMEwGrm4UtA@mail.gmail.com>
 <DGZRYXTKC049.1I6QFQSMSD88H@arkamax.eu> <DGZTXRKSHBPC.2B318HF53ZRSN@arkamax.eu>
In-Reply-To: <DGZTXRKSHBPC.2B318HF53ZRSN@arkamax.eu>
From: Yi Zhang <yi.zhang@redhat.com>
Date: Wed, 11 Mar 2026 23:08:41 +0800
X-Gm-Features: AaiRm52s-EH5ucY3yGw_WaFk4XtbskkABtsWUN8MID31uF9eSwnbqLdAEQHevQY
Message-ID: <CAHj4cs_nQEbeyvqvos7pwek8k0rLLXCghdoY9EsL4bCgZrxqtA@mail.gmail.com>
Subject: Re: blktests failures with v7.0-rc1 kernel
To: Maurizio Lombardi <mlombard@arkamax.eu>
Cc: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>, 
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, 
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>, 
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "nbd@other.debian.org" <nbd@other.debian.org>, 
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sJiwRddW-7JAw9TKquMVhZL3Tou5sYwMY05qQLQk3_Y_1773241750
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <vfWty1MfE4J.A.zW1O.TnYspB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3518
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAHj4cs_nQEbeyvqvos7pwek8k0rLLXCghdoY9EsL4bCgZrxqtA@mail.gmail.com
Resent-Date: Wed, 11 Mar 2026 15:27:15 +0000 (UTC)
X-Spamd-Result: default: False [-1.01 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mlombard@arkamax.eu,m:shinichiro.kawasaki@wdc.com,m:linux-block@vger.kernel.org,m:linux-nvme@lists.infradead.org,m:linux-scsi@vger.kernel.org,m:nbd@other.debian.org,m:linux-rdma@vger.kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_SPF_NA(0.00)[no SPF record];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER(0.00)[yi.zhang@redhat.com,bounce-nbd=lists@other.debian.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[yi.zhang@redhat.com,bounce-nbd=lists@other.debian.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:8365, ipnet:2001:41b8::/29, country:DE];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[nbd];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,arkamax.eu:email]
X-Rspamd-Queue-Id: 633262667BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 5:02=E2=80=AFPM Maurizio Lombardi <mlombard@arkamax=
.eu> wrote:
>
> On Wed Mar 11, 2026 at 8:29 AM CET, Maurizio Lombardi wrote:
> > On Wed Mar 11, 2026 at 1:35 AM CET, Yi Zhang wrote:
> >
> > If nvmet_rdma_rw_ctx_init() fails, shouldn't it call
> > nvmet_req_free_sgls() before returning an error?
>
> Possible fix, not tested:
>
Hi Maurizio
The kmemleak still can be reproduced with this patch:

unreferenced object 0xffff88811db23d80 (size 32):
  comm "kworker/16:1H", pid 1360, jiffies 4296118279
  hex dump (first 32 bytes):
    82 3b 85 04 00 ea ff ff 00 00 00 00 00 10 00 00  .;..............
    00 e0 4e 21 81 88 ff ff 00 10 00 00 00 00 00 00  ..N!............
  backtrace (crc 4bb38867):
    __kmalloc_noprof+0x6f1/0xa10
    sgl_alloc_order+0x9e/0x370
    nvmet_req_alloc_sgls+0x294/0x4f0 [nvmet]
    nvmet_rdma_map_sgl_keyed+0x25d/0x9a0 [nvmet_rdma]
    nvmet_rdma_handle_command+0x1ed/0x4e0 [nvmet_rdma]
    __ib_process_cq+0x139/0x4b0 [ib_core]
    ib_cq_poll_work+0x4d/0x160 [ib_core]
    process_one_work+0x8b1/0x15e0
    worker_thread+0x5e9/0xfc0
    kthread+0x36b/0x470
    ret_from_fork+0x5bf/0x910
    ret_from_fork_asm+0x1a/0x30


> diff --git a/drivers/nvme/target/rdma.c b/drivers/nvme/target/rdma.c
> index 2d6eb89f98af..79ae743bb405 100644
> --- a/drivers/nvme/target/rdma.c
> +++ b/drivers/nvme/target/rdma.c
> @@ -892,7 +892,7 @@ static u16 nvmet_rdma_map_sgl_keyed(struct nvmet_rdma=
_rsp *rsp,
>
>         ret =3D nvmet_rdma_rw_ctx_init(rsp, addr, key, &sig_attrs);
>         if (unlikely(ret < 0))
> -               goto error_out;
> +               goto error_free_sgl;
>         rsp->n_rdma +=3D ret;
>
>         if (invalidate)
> @@ -900,6 +900,8 @@ static u16 nvmet_rdma_map_sgl_keyed(struct nvmet_rdma=
_rsp *rsp,
>
>         return 0;
>
> +error_free_sgl:
> +       nvmet_req_free_sgls(&rsp->req);
>  error_out:
>         rsp->req.transfer_len =3D 0;
>         return NVME_SC_INTERNAL;
>
> Maurizio
>


--=20
Best Regards,
  Yi Zhang

