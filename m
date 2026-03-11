Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJG/OaMfsWnkrAIAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Wed, 11 Mar 2026 08:54:11 +0100
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 8859A25E3FF
	for <lists+nbd@lfdr.de>; Wed, 11 Mar 2026 08:54:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4718F20475; Wed, 11 Mar 2026 07:54:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar 11 07:54:11 2026
Old-Return-Path: <mlombard@arkamax.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=4.0 tests=KHOP_HELO_FCRDNS,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	RDNS_DYNAMIC autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8981D20466
	for <lists-other-nbd@bendel.debian.org>; Wed, 11 Mar 2026 07:36:41 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.345 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, KHOP_HELO_FCRDNS=0.4, PDS_RDNS_DYNAMIC_FP=0.01,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.717,
	RCVD_IN_VALIDITY_SAFE_BLOCKED=0.236, RDNS_DYNAMIC=0.982]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 3_6MDijgq1U7 for <lists-other-nbd@bendel.debian.org>;
	Wed, 11 Mar 2026 07:36:34 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 399 seconds by postgrey-1.36 at bendel; Wed, 11 Mar 2026 07:36:34 UTC
Received: from arkamax.eu (128-116-240-228.dyn.eolo.it [128.116.240.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA512)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id A286220437
	for <nbd@other.debian.org>; Wed, 11 Mar 2026 07:36:33 +0000 (UTC)
Received: from localhost (128-116-240-228.dyn.eolo.it [128.116.240.228])
	by arkamax.eu (OpenSMTPD) with ESMTPSA id 1f15775b (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 11 Mar 2026 08:29:51 +0100 (CET)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 08:29:51 +0100
Message-Id: <DGZRYXTKC049.1I6QFQSMSD88H@arkamax.eu>
To: "Yi Zhang" <yi.zhang@redhat.com>, "Shinichiro Kawasaki"
 <shinichiro.kawasaki@wdc.com>
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "nbd@other.debian.org" <nbd@other.debian.org>, "linux-rdma@vger.kernel.org"
 <linux-rdma@vger.kernel.org>
Subject: Re: blktests failures with v7.0-rc1 kernel
From: "Maurizio Lombardi" <mlombard@arkamax.eu>
X-Mailer: aerc 0.21.0
References: <aZ_-cH8euZLySxdD@shinmob>
 <CAHj4cs8mzSZez+n2qLu5931YAuQ4=RxNt6D6YJCsMEwGrm4UtA@mail.gmail.com>
In-Reply-To: <CAHj4cs8mzSZez+n2qLu5931YAuQ4=RxNt6D6YJCsMEwGrm4UtA@mail.gmail.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <9nVB3x2W1jI.A.bUvH.j-RspB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3516
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/DGZRYXTKC049.1I6QFQSMSD88H@arkamax.eu
Resent-Date: Wed, 11 Mar 2026 07:54:11 +0000 (UTC)
X-Rspamd-Queue-Id: 8859A25E3FF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.09 / 15.00];
	AUTH_NA(1.00)[];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[generic];
	RWL_MAILSPIKE_GOOD(-0.10)[82.195.75.100:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:yi.zhang@redhat.com,m:shinichiro.kawasaki@wdc.com,m:linux-block@vger.kernel.org,m:linux-nvme@lists.infradead.org,m:linux-scsi@vger.kernel.org,m:nbd@other.debian.org,m:linux-rdma@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[arkamax.eu];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	FORGED_SENDER(0.00)[mlombard@arkamax.eu,bounce-nbd=lists@other.debian.org];
	R_SPF_NA(0.00)[no SPF record];
	ASN(0.00)[asn:8365, ipnet:82.195.64.0/19, country:DE];
	ARC_NA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mlombard@arkamax.eu,bounce-nbd=lists@other.debian.org];
	NEURAL_HAM(-0.00)[-0.878];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[nbd];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arkamax.eu:mid,wdc.com:email,bendel.debian.org:rdns,bendel.debian.org:helo]
X-Rspamd-Action: no action

On Wed Mar 11, 2026 at 1:35 AM CET, Yi Zhang wrote:
> On Thu, Feb 26, 2026 at 4:09=E2=80=AFPM Shinichiro Kawasaki
> <shinichiro.kawasaki@wdc.com> wrote:
>>
>
> I also reproduced this kmemleak issue with the blktests nvme/rdma
> test. Here is the log:
>
> unreferenced object 0xffff8882e7545a40 (size 32):
>   comm "kworker/0:0H", pid 36658, jiffies 4303559899
>   hex dump (first 32 bytes):
>     02 81 aa 09 00 ea ff ff 00 00 00 00 00 10 00 00  ................
>     00 40 a0 6a 82 88 ff ff 00 10 00 00 00 00 00 00  .@.j............
>   backtrace (crc e5de3e0c):
>     __kmalloc_noprof+0x6f1/0xa10
>     sgl_alloc_order+0x9e/0x370
>     nvmet_req_alloc_sgls+0x294/0x4f0 [nvmet]
>     nvmet_rdma_map_sgl_keyed+0x25a/0x940 [nvmet_rdma]
>     nvmet_rdma_handle_command+0x1ed/0x4e0 [nvmet_rdma]
>     __ib_process_cq+0x139/0x4b0 [ib_core]
>     ib_cq_poll_work+0x4d/0x160 [ib_core]
>     process_one_work+0x8b1/0x15e0
>     worker_thread+0x5e9/0xfc0
>     kthread+0x36b/0x470
>     ret_from_fork+0x5bf/0x910
>     ret_from_fork_asm+0x1a/0x30
> unreferenced object 0xffff8882e7545280 (size 32):
>   comm "kworker/0:0H", pid 36658, jiffies 4303559900
>   hex dump (first 32 bytes):
>     02 2b 82 0b 00 ea ff ff 00 00 00 00 00 10 00 00  .+..............
>     00 c0 8a e0 82 88 ff ff 00 10 00 00 00 00 00 00  ................
>   backtrace (crc 42d20147):
>     __kmalloc_noprof+0x6f1/0xa10
>     sgl_alloc_order+0x9e/0x370
>     nvmet_req_alloc_sgls+0x294/0x4f0 [nvmet]
>     nvmet_rdma_map_sgl_keyed+0x25a/0x940 [nvmet_rdma]
>     nvmet_rdma_handle_command+0x1ed/0x4e0 [nvmet_rdma]
>     __ib_process_cq+0x139/0x4b0 [ib_core]
>     ib_cq_poll_work+0x4d/0x160 [ib_core]
>     process_one_work+0x8b1/0x15e0
>     worker_thread+0x5e9/0xfc0
>     kthread+0x36b/0x470
>     ret_from_fork+0x5bf/0x910
>     ret_from_fork_asm+0x1a/0x30

Maybe the problem is in the nvmet_rdma_map_sgl_keyed() function

static u16 nvmet_rdma_map_sgl_keyed(struct nvmet_rdma_rsp *rsp,
                struct nvme_keyed_sgl_desc *sgl, bool invalidate)
{
        u64 addr =3D le64_to_cpu(sgl->addr);
        u32 key =3D get_unaligned_le32(sgl->key);
        struct ib_sig_attrs sig_attrs;
        int ret;

        rsp->req.transfer_len =3D get_unaligned_le24(sgl->length);

        /* no data command? */
        if (!rsp->req.transfer_len)
                return 0;

        if (rsp->req.metadata_len)
                nvmet_rdma_set_sig_attrs(&rsp->req, &sig_attrs);

        ret =3D nvmet_req_alloc_sgls(&rsp->req);
        if (unlikely(ret < 0))
                goto error_out;

        ret =3D nvmet_rdma_rw_ctx_init(rsp, addr, key, &sig_attrs);
        if (unlikely(ret < 0))
                goto error_out;
        rsp->n_rdma +=3D ret;

        if (invalidate)
                rsp->invalidate_rkey =3D key;

        return 0;

error_out:
        rsp->req.transfer_len =3D 0;
        return NVME_SC_INTERNAL;
}

If nvmet_rdma_rw_ctx_init() fails, shouldn't it call
nvmet_req_free_sgls() before returning an error?

Maurizio

