Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 936E5273965
	for <lists+nbd@lfdr.de>; Tue, 22 Sep 2020 05:51:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5F28920413; Tue, 22 Sep 2020 03:51:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep 22 03:51:09 2020
Old-Return-Path: <houpu@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 251CD203E2
	for <lists-other-nbd@bendel.debian.org>; Tue, 22 Sep 2020 03:35:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 9cCa5sNoYpEM for <lists-other-nbd@bendel.debian.org>;
	Tue, 22 Sep 2020 03:35:11 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 9FC6120410
	for <nbd@other.debian.org>; Tue, 22 Sep 2020 03:35:11 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id x22so6367576pfo.12
        for <nbd@other.debian.org>; Mon, 21 Sep 2020 20:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7QkOITZripORvfYFmAqjwDsc4o7hDGWfLOqnFTo7WBk=;
        b=2KWTco2NHZRxDcegJPUTJR/iA3i5RXFXlde0zICRzDXR4E6ThcksdQYDr/r1IHHY60
         2ULnejJw2PwcVzrOjGGjwwbBNDK55Tx+kvOl2Sw8cI9rQqtk088fOsk/XU7ruGL88nDQ
         6fLcJ6GGdVCdCujcef93p+4eMhzzz5req84UjgRq+X1F43+vNCFKEkgX+iiL8REzSM8V
         vjDC/UKXL2TVN6zxoQ0UanJK1vdgD6DF6tCAz9w4VgPASo5HE9nca1jkeRX/B0Gxp2Xl
         9Dtdk/zkQKfG3umO1jj6qNK3rdGNzoz4O+fJij3EdWG0zbDpE96w3XNtxSwGramPt8Y5
         efDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7QkOITZripORvfYFmAqjwDsc4o7hDGWfLOqnFTo7WBk=;
        b=pPVrLt/Q6zyWFsxsg3Igo/pjqBJ6v19s9RaMPDjovt/s5+CAVofi1CzSf9PgzYKgVI
         eNQKdZy0aPbQMIL0j21zJUSxA3syyLXwc4x9lZ0oyBkEQIWOY+qjseXWb89x9krJvuew
         +7+jbFFUtvUQOsg4cB/Y/yMT4x366uhL2DNU7I3PH39+qMX3K8bbGQg4VbZfHx2JkJyv
         rmE+iA0fMWEIzTIr3JMNLpSm6Dtu3tT1JxH48ixRv1hZwRBKR943o9PoJDLD1kU1jyrw
         ytNZoPuAGWxZoVirOO+1PyO+5q8Uqm+iA8JCQAI60TDR8ewIxAnCP4MKQMC3pZpAISiG
         MRLw==
X-Gm-Message-State: AOAM5334m/0gKMYw1L5nU3H5NzyUMUF1zfreNqF2ym+DqQ1cGILBlMY7
	0P0y3WaTofe4HdUkRKIr65wUUPhtqaRoSWcN
X-Google-Smtp-Source: ABdhPJwkW7c/HyVettrmYzhqoEZUTrbUSHaUdanzwtM3uelWZLzAOhJu/YTnfXliM/Z85yataGiF2w==
X-Received: by 2002:a63:cd0b:: with SMTP id i11mr1996891pgg.306.1600745708375;
        Mon, 21 Sep 2020 20:35:08 -0700 (PDT)
Received: from box.bytedance.net ([61.120.150.73])
        by smtp.gmail.com with ESMTPSA id mp3sm714859pjb.33.2020.09.21.20.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 20:35:07 -0700 (PDT)
From: Hou Pu <houpu@bytedance.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: mchristi@redhat.com,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Hou Pu <houpu@bytedance.com>
Subject: [PATCH v2 0/2] nbd: improve timeout handling and a fix
Date: Tue, 22 Sep 2020 11:34:55 +0800
Message-Id: <20200922033457.46227-1-houpu@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <jIAas246zoG.A.0i.tSXafB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/999
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200922033457.46227-1-houpu@bytedance.com
Resent-Date: Tue, 22 Sep 2020 03:51:09 +0000 (UTC)

Patch #1 is a fix. Patch #2 and #3 are trying to improve io timeout
handling.

Thanks,
Hou

v2 changes:
* Add 'Reviewed-by: Josef Bacik <josef@toxicpanda.com>' in patch #1.
* Original patch #2 is dropped.
* Keep the behavior same as before when we don't set a .timeout
and num_connections > 1.
* Coding style fixes.

Hou Pu (2):
  nbd: return -ETIMEDOUT when NBD_DO_IT ioctl returns
  nbd: introduce a client flag to do zero timeout handling

 drivers/block/nbd.c      | 33 ++++++++++++++++++++++++++++-----
 include/uapi/linux/nbd.h |  4 ++++
 2 files changed, 32 insertions(+), 5 deletions(-)

-- 
2.11.0

