Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CAADF691
	for <lists+nbd@lfdr.de>; Mon, 21 Oct 2019 22:12:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 25B8A203A0; Mon, 21 Oct 2019 20:12:29 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Oct 21 20:12:29 2019
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VERIFIED,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6DD14203A0
	for <lists-other-nbd@bendel.debian.org>; Mon, 21 Oct 2019 19:56:42 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id pqaDIK9GQ7k0 for <lists-other-nbd@bendel.debian.org>;
	Mon, 21 Oct 2019 19:56:38 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qk1-x72e.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 2678C2039E
	for <nbd@other.debian.org>; Mon, 21 Oct 2019 19:56:34 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id y81so10044153qkb.7
        for <nbd@other.debian.org>; Mon, 21 Oct 2019 12:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6SOd1NDUElyNNC6sJJPfBCinbO2wmPqMmYAhpTG4xqw=;
        b=pvmc6TmTN5dT9XNou294j52FGLXmMnB5WKKsuY2uMGNP0+grDGJu6trFTAAQRog3vF
         nlKsPX+mhR6uUMrQ/RHKEMlk7aEdszv/1+h3DilR0kK9Pilip9yVyABu20fY3p1oBJ21
         7sqSaXljpuv8hljeHPOfSjGp2ryau3D2zw3jAxGnrKNwjaHfhiBhSIYZ6VdDLfG+oGFj
         a5fXkI7MCsfnpD+bthXvEGw4k0UdftUteZDp1zwyT9vUnxz7pBC/Zm/elXsG5GpUW42f
         botkcA9Ypb6/8BZhNk3wHk4oHC+bzOovQi9gMs2HAy1sONJ2098p7sXIiIQZdVATO5ch
         WkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6SOd1NDUElyNNC6sJJPfBCinbO2wmPqMmYAhpTG4xqw=;
        b=baSFJRDwdbYcooEhguQpLT3ZsLrT9PyC2owyZWJ5MaGYokCkqNmr0KP/kpqVMe7SAF
         Y/xqb/b2W4BnsbJAJG8rNWg1TsSoPB043f0VXy1AfkhMT4kkIz8Yvt4eok5GrWcXyBD9
         CloCfaviT2apyHt6k29s4gCaAWnySgi1BMZRwbYCykP2kYkvZsG0wvMa5j1QzQQqK5xR
         908453KyW0/DDhwGf/mBCd+yPJRMYB5zgpofEW8ZIBY1pXVmXgz6NfRpfOOYHVY95lcT
         Dpj389aspAfomBiyZmp4+DNWuExBQSTrzkLIBj0WYEH9gpCt7Xzo9amBMEP/HN2MtZ+v
         kSdw==
X-Gm-Message-State: APjAAAUGPXzUOQ+cuchyr4NzLaieakNmMotKacqhoMHfSEHDU5omKyOj
	ogQDJZ5ydBq/rvm3DgoTytS+Zg==
X-Google-Smtp-Source: APXvYqzaxQcGOVHl9VXYuOfzdWxu800rP2kr7RQ1pyQmWQ+NERVPplWudZN5XUoV3RSylCda3cg9hA==
X-Received: by 2002:a05:620a:526:: with SMTP id h6mr13491287qkh.213.1571687791017;
        Mon, 21 Oct 2019 12:56:31 -0700 (PDT)
Received: from localhost ([107.15.81.208])
        by smtp.gmail.com with ESMTPSA id v141sm8174494qka.59.2019.10.21.12.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2019 12:56:30 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
To: axboe@kernel.dk,
	nbd@other.debian.org,
	linux-block@vger.kernel.org,
	kernel-team@fb.com,
	mchristi@redhat.com
Subject: [PATCH 0/2] fix double completion of timed out commands
Date: Mon, 21 Oct 2019 15:56:26 -0400
Message-Id: <20191021195628.19849-1-josef@toxicpanda.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <KU_eyEXNIDL.A.HZE.tEhrdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/720
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20191021195628.19849-1-josef@toxicpanda.com
Resent-Date: Mon, 21 Oct 2019 20:12:29 +0000 (UTC)

We noticed a problem where NBD sometimes double completes the same request when
things go wrong and we time out the request.  If the other side goes out to
lunch but happens to reply just as we're timing out the requests we can end up
with a double completion on the request.

We already keep track of the command status, we just need to make sure we
protect all cases where we set cmd->status with the cmd->lock, which is patch
#1.  Patch #2 is the fix for the problem, which catches the case where we race
with the timeout handler and the reply handler.  Thanks,

Josef

