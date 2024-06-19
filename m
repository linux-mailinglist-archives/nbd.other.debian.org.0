Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEF690F0C3
	for <lists+nbd@lfdr.de>; Wed, 19 Jun 2024 16:36:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3117820828; Wed, 19 Jun 2024 14:36:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jun 19 14:36:10 2024
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8F60420838
	for <lists-other-nbd@bendel.debian.org>; Wed, 19 Jun 2024 14:19:01 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.01 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MD5_SHA1_SUM=-1, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id xi2P8jf8O5eF for <lists-other-nbd@bendel.debian.org>;
	Wed, 19 Jun 2024 14:18:47 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-pl1-x62d.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 1E2F720828
	for <nbd@other.debian.org>; Wed, 19 Jun 2024 14:18:46 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1f99e2dc8cdso2191335ad.0
        for <nbd@other.debian.org>; Wed, 19 Jun 2024 07:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1718806723; x=1719411523; darn=other.debian.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kVFpcyqMw7891fhn8oME2l6O88u8sGFZorCmmUmii2A=;
        b=jK9crURHupbmU9DlbeS9oUx66uRmVPxswOCcUahkUrrtvw886/exAewcPeIxemEuzm
         ZZmcu78mb6+lLUg414v0MuVS6SjCGlJ/hFbYFbk6t7u41QIJgRos/T+ywpKI3HCFJqKd
         Lp8ZTYR7fLvmp7YX2qQe9anNMD6hBL4eAbzyZqVpIE1PQUQXCayUtee+Kt4tMYqrEckm
         dzz+drjrwz4cF5kiPazijyLe7C7p2+s6L8hcP2IuprpW/6cdZ3Gsgnu974v+krz1LWsq
         k++/Td+Er/SEBjwUUSwCeFwlbqNyGKnFTpmQXyOtgpwaSfziWmAqeSQDAC3o4kwjnif8
         jmhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718806723; x=1719411523;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kVFpcyqMw7891fhn8oME2l6O88u8sGFZorCmmUmii2A=;
        b=qVilHZMRIT4D0/QdJjiskfWYQ20V8fk2E7duDqX3mIRUtvOlf69DI6jROP3yzXRdQl
         8HXQLF1vSCIWjopeDFp9aEZo41RhRoVDb8oakFtbYRKq0yvJogOwUg/jp3MIyYq+jp+L
         ap/ZLwakDTVR16cGS8pREUZzkU0x7KvfG6IjyKxk0L+Xj9X0Y8PeQw+jRn4g+n9+EqDp
         U+DefLN1ruH1t+e7ra5jQ9czd/svyBBzKG3jsmKvmGSo1cclAHYoCCTZKD2Bm1vONq3u
         9owd1gpx55lEZnNgsIK1KPb2f2TeDOUQzu572gpA7SoOLGN90wfCBPnOeF0qhb29fwVj
         xtTA==
X-Forwarded-Encrypted: i=1; AJvYcCV94B13XB+UkDvyw6s2L2SxzZvR4eGOG9KNXDc3HgybgyeYqpf3vsJeyKhDrDgFcPnpdH54bOJb7wrfuytmGRD5Z27oUA==
X-Gm-Message-State: AOJu0YzyhkDxjMASnIXqqF6ErVi4WQT9CIX4OWoQYsxKDXQZDAebUCCk
	vc2pEK66SF7IxbcsxFt9dnp6WbI+Idb6+dgvS6RbJlC5Oz/+wPxIpUiRcy6PCEw=
X-Google-Smtp-Source: AGHT+IEWR0naxsjqG6PjL5n5tEp1Ci8rJdxP3J1CbAApgRxLYFkmM+R0aL8qHW5Lv8+tjuuvrYAkhg==
X-Received: by 2002:a05:6a20:3ca0:b0:1b6:fadd:8862 with SMTP id adf61e73a8af0-1bcbb8ce3e2mr2590711637.6.1718806723107;
        Wed, 19 Jun 2024 07:18:43 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb3d2e8sm10689218b3a.107.2024.06.19.07.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 07:18:42 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Hellwig <hch@lst.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
 Richard Weinberger <richard@nod.at>, 
 Philipp Reisner <philipp.reisner@linbit.com>, 
 Lars Ellenberg <lars.ellenberg@linbit.com>, 
 =?utf-8?q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, 
 Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
 Mikulas Patocka <mpatocka@redhat.com>, Song Liu <song@kernel.org>, 
 Yu Kuai <yukuai3@huawei.com>, Vineeth Vijayan <vneethv@linux.ibm.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 linux-m68k@lists.linux-m68k.org, linux-um@lists.infradead.org, 
 drbd-dev@lists.linbit.com, nbd@other.debian.org, 
 linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org, 
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org, 
 linux-bcache@vger.kernel.org, dm-devel@lists.linux.dev, 
 linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org, 
 linux-mtd@lists.infradead.org, nvdimm@lists.linux.dev, 
 linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-block@vger.kernel.org
In-Reply-To: <20240617060532.127975-1-hch@lst.de>
References: <20240617060532.127975-1-hch@lst.de>
Subject: Re: move features flags into queue_limits v2
Message-Id: <171880672048.115609.5962725096227627176.b4-ty@kernel.dk>
Date: Wed, 19 Jun 2024 08:18:40 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Cegor4ZHgPJ.A.DeSG.azucmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3069
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/171880672048.115609.5962725096227627176.b4-ty@kernel.dk
Resent-Date: Wed, 19 Jun 2024 14:36:10 +0000 (UTC)


On Mon, 17 Jun 2024 08:04:27 +0200, Christoph Hellwig wrote:
> this is the third and last major series to convert settings to
> queue_limits for this merge window.  After a bunch of prep patches to
> get various drivers in shape, it moves all the queue_flags that specify
> driver controlled features into the queue limits so that they can be
> set atomically and are separated from the blk-mq internal flags.
> 
> Note that I've only Cc'ed the maintainers for drivers with non-mechanical
> changes as the Cc list is already huge.
> 
> [...]

Applied, thanks!

[01/26] xen-blkfront: don't disable cache flushes when they fail
        commit: dd9300e9eaeeb212f77ffeb72d1d8756107f1f1f
[02/26] sd: remove sd_is_zoned
        commit: be60e7700e6df1e16a2f60f45bece08e6140a46d
[03/26] sd: move zone limits setup out of sd_read_block_characteristics
        commit: 308ad58af49d6c4c3b7a36b98972cc9db4d7b36a
[04/26] loop: stop using loop_reconfigure_limits in __loop_clr_fd
        commit: c9055b44abe60da69aa4ee4fdcb78ee7fe733335
[05/26] loop: always update discard settings in loop_reconfigure_limits
        commit: ae0d40ff49642651f969883ef9fc79d69c1632d7
[06/26] loop: regularize upgrading the block size for direct I/O
        commit: a17ece76bcfe7b86327b19cae1652d7c62068a30
[07/26] loop: also use the default block size from an underlying block device
        commit: 4ce37fe0938b02b7b947029c40b72d76a22a3882
[08/26] loop: fold loop_update_rotational into loop_reconfigure_limits
        commit: 97dd4a43d69b74a114be466d6887e257971adfe9
[09/26] virtio_blk: remove virtblk_update_cache_mode
        commit: bbe5c84122b35c37f2706872fe34da66f0854b56
[10/26] nbd: move setting the cache control flags to __nbd_set_size
        commit: 6b377787a306253111404325aee98005b361e59a
[11/26] block: freeze the queue in queue_attr_store
        commit: af2814149883e2c1851866ea2afcd8eadc040f79
[12/26] block: remove blk_flush_policy
        commit: 70905f8706b62113ae32c8df721384ff6ffb6c6a
[13/26] block: move cache control settings out of queue->flags
        commit: 1122c0c1cc71f740fa4d5f14f239194e06a1d5e7
[14/26] block: move the nonrot flag to queue_limits
        commit: bd4a633b6f7c3c6b6ebc1a07317643270e751a94
[15/26] block: move the add_random flag to queue_limits
        commit: 39a9f1c334f9f27b3b3e6d0005c10ed667268346
[16/26] block: move the io_stat flag setting to queue_limits
        commit: cdb2497918cc2929691408bac87b58433b45b6d3
[17/26] block: move the stable_writes flag to queue_limits
        commit: 1a02f3a73f8c670eddeb44bf52a75ae7f67cfc11
[18/26] block: move the synchronous flag to queue_limits
        commit: aadd5c59c910427c0464c217d5ed588ff14e2502
[19/26] block: move the nowait flag to queue_limits
        commit: f76af42f8bf13d2620084f305f01691de9238fc7
[20/26] block: move the dax flag to queue_limits
        commit: f467fee48da4500786e145489787b37adae317c3
[21/26] block: move the poll flag to queue_limits
        commit: 8023e144f9d6e35f8786937e2f0c2fea0aba6dbc
[22/26] block: move the zoned flag into the features field
        commit: b1fc937a55f5735b98d9dceae5bb6ba262501f56
[23/26] block: move the zone_resetall flag to queue_limits
        commit: a52758a39768f441e468a41da6c15a59d6d6011a
[24/26] block: move the pci_p2pdma flag to queue_limits
        commit: 9c1e42e3c876c66796eda23e79836a4d92613a61
[25/26] block: move the skip_tagset_quiesce flag to queue_limits
        commit: 8c8f5c85b20d0a7dc0ab9b2a17318130d69ceb5a
[26/26] block: move the bounce flag into the features field
        commit: 339d3948c07b4aa2940aeb874294a7d6782cec16

Best regards,
-- 
Jens Axboe



